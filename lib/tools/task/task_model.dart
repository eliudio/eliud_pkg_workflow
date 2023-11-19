import 'package:eliud_core/core/base/model_base.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_pkg_notifications/platform/platform.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core_model/tools/etc/random.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';
import 'package:eliud_pkg_workflow/model/workflow_notification_model.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_model.dart';
import 'package:eliud_pkg_workflow/tools/helper/deterimine_member_helper.dart';
import 'package:eliud_pkg_workflow/tools/task/task_entity.dart';
import 'package:eliud_pkg_workflow/tools/task/task_model_registry.dart';
import 'package:flutter/cupertino.dart';

import 'execution_results.dart';

typedef FinaliseWorkflow = void Function(
    BuildContext context, bool success, AssignmentModel assignmentModel);

abstract class TaskModel {
  final String identifier;
  String description;
  bool
      executeInstantly; // Execute instantly? When a triggering assignment has been finalised by a member and when the next assignment is also assigned to this member, then it will be executed instantly when set",

  bool? _isNewAssignment;
  FinaliseWorkflow? _finaliseWorkflow;

  TaskModel(
      {required this.identifier,
      required this.description,
      required this.executeInstantly});

  TaskEntity toEntity({String? appId});

  Future<List<ModelReference>> collectReferences({String? appId});

  static TaskModel? fromEntity(TaskEntity? entity) {
    if (entity == null) return null;

    var mapper = TaskModelApis.apis().getMapper(entity.identifier);
    if (mapper != null) {
      return mapper.fromEntity(entity);
    }

    return null;
  }

  static Future<TaskModel?> fromEntityPlus(TaskEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    var mapper = TaskModelApis.apis().getMapper(entity.identifier);
    if (mapper != null) {
      return mapper.fromEntityPlus(entity);
    }

    return null;
  }

  /*
   * Execute the task. Implement this method in your task
   */
  Future<void> startTask(AppModel app, BuildContext context, String? memberId,
      AssignmentModel? assignmentModel);

  /*
   * Finalise the task. Call this method from your execute upon success. This pattern, rather than a simple return value from your execute is
   * to allow asynchronous execution of your task(s).
   */
  Future<void> finishTask(
      AppModel app,
      BuildContext context,
      AssignmentModel assignmentModel,
      ExecutionResults executionResult,
      String? feedback) async {
    var state = AccessBloc.getState(context);
    if (state is AccessDetermined) {
      await _handleCurrentAssignment(
          context, assignmentModel, _isNewAssignment, executionResult);
      if (state.getMember() != null) {
        var member = state.getMember();
        if (member != null) {
          if (executionResult.status == ExecutionStatus.success) {
            await _sendMessage(
                app.documentID,
                member.documentID,
                assignmentModel.confirmMessage,
                app,
                member,
                assignmentModel,
                feedback);
            var nextAssignment = await _nextAssignment(
                context, assignmentModel, executionResult, member, app);
            if (nextAssignment != null) {
              // if the next assignment is assigned to the currently logged in member, then present it instantly:
              MemberModel? currentMember =
                  AccessBloc.getState(context).getMember();
              if ((currentMember != null) &&
                  (nextAssignment.assigneeId == currentMember.documentID) &&
                  nextAssignment.task!.executeInstantly) {
                nextAssignment.task!.callExecute(app, context,
                    currentMember.documentID, nextAssignment, false,
                    finaliseWorkflow: _finaliseWorkflow);
              }
            }
          } else {
            await _sendMessage(
                app.documentID,
                member.documentID,
                assignmentModel.rejectMessage,
                app,
                member,
                assignmentModel,
                feedback);
          }
        }
      }
    }
    if ((_finaliseWorkflow != null)) {
      _finaliseWorkflow!(context,
          executionResult.status == ExecutionStatus.success, assignmentModel);
    }
  }

  /* This method is called by the workflow framework */
  void callExecute(AppModel app, BuildContext context, String? memberId,
      AssignmentModel? assignmentModel, bool isNewAssignment,
      {FinaliseWorkflow? finaliseWorkflow}) {
    _isNewAssignment = isNewAssignment;
    _finaliseWorkflow = finaliseWorkflow;

    startTask(app, context, memberId, assignmentModel);
  }

  Future<void> _handleCurrentAssignment(
      BuildContext context,
      AssignmentModel assignmentModel,
      bool? isNewAssignment,
      ExecutionResults executionResult) async {
    AssignmentStatus? assignmentStatus;
    switch (executionResult.status) {
      case ExecutionStatus.success:
        assignmentStatus = AssignmentStatus.success;
        break;
      case ExecutionStatus.decline:
        assignmentStatus = AssignmentStatus.declined;
        break;
      case ExecutionStatus.failure:
        break;
      case ExecutionStatus.delay:
        break;
    }
    assignmentModel.resultsCurrent = executionResult.results;
    assignmentModel.status = assignmentStatus;
    if (isNewAssignment!) {
      await AbstractRepositorySingleton.singleton
          .assignmentRepository(assignmentModel.appId)!
          .add(assignmentModel);
    } else {
      await AbstractRepositorySingleton.singleton
          .assignmentRepository(assignmentModel.appId)!
          .update(assignmentModel);
    }
  }

  Future<void> _sendMessage(
      String appId,
      String memberId,
      WorkflowNotificationModel? workflowNotificationModel,
      AppModel app,
      MemberModel member,
      AssignmentModel currentAssignment,
      String? feedback) async {
    if (workflowNotificationModel != null) {
      var message = workflowNotificationModel.message;
      if (feedback != null) {
        message = "${message!} $feedback";
      }
      var addressee = workflowNotificationModel.addressee;
      String? to = await (DetermineMemberHelper
          .determineMemberWithWorkflowNotificationAddressee(
              addressee, app, member, currentAssignment));
      if (to == null) {
        print("error can't determine addressee to send message");
      } else {
        await AbstractNotificationPlatform.platform!
            .sendMessage(app, memberId, to, message!);
      }
    }
  }

  Future<AssignmentModel?> _nextAssignment(
      BuildContext context,
      AssignmentModel currentAssignment,
      ExecutionResults executionResult,
      MemberModel member,
      AppModel app) async {
    var tasks = currentAssignment.workflow!.workflowTask!;
    var found = -1;
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].seqNumber == currentAssignment.workflowTaskSeqNumber) {
        found = i;
        break;
      }
    }

    if (found >= 0) {
      if (found + 1 < tasks.length) {
        var nextTask = tasks[found + 1];
        WorkflowTaskModel workflowTaskModel =
            currentAssignment.workflow!.workflowTask![found + 1];
        var nextAssignment = AssignmentModel(
            documentID: newRandomKey(),
            appId: currentAssignment.appId,
            reporterId: member.documentID,
            assigneeId: await DetermineMemberHelper
                .determineMemberWithWorkflowTaskResponsible(
                    nextTask.responsible, app, member, currentAssignment),
            task: nextTask.task,
            workflow: currentAssignment.workflow,
            status: AssignmentStatus.open,
            triggeredById: currentAssignment.documentID,
            workflowTaskSeqNumber: workflowTaskModel.seqNumber,
            confirmMessage: workflowTaskModel.confirmMessage,
            rejectMessage: workflowTaskModel.rejectMessage,
            resultsPrevious: executionResult.results);
        return await AbstractRepositorySingleton.singleton
            .assignmentRepository(currentAssignment.appId)!
            .add(nextAssignment);
      } else {
        // no next task to do
      }
    } else {
      // task not found: error in workflow
    }
    return null;
  }
}
