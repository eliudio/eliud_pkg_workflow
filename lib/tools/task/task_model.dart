import 'package:eliud_pkg_notifications/platform/platform.dart';
import 'dart:collection';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_model.dart';
import 'package:eliud_pkg_workflow/model/workflow_notification_model.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_model.dart';
import 'package:eliud_pkg_workflow/tools/helper/deterimine_member_helper.dart';
import 'package:eliud_pkg_workflow/tools/task/task_entity.dart';
import 'package:eliud_pkg_workflow/tools/task/task_model_registry.dart';
import 'package:flutter/cupertino.dart';

import 'execution_results.dart';

typedef void FinaliseWorkflow(bool success, AssignmentModel assignmentModel);

abstract class TaskModel {
  final String identifier;
  String description;
  bool executeInstantly; // Execute instantly? When a triggering assignment has been finalised by a member and when the next assignment is also assigned to this member, then it will be executed instantly when set",

  bool? _isNewAssignment;
  FinaliseWorkflow? _finaliseWorkflow;

    TaskModel({required this.identifier, required this.description, required this.executeInstantly});

  TaskEntity toEntity({String? appId});

  static TaskModel? fromEntity(TaskEntity? entity) {
    if (entity == null) return null;

    var mapper = TaskModelRegistry.registry()!.getMapper(entity.identifier);
    if (mapper != null) {
      return mapper.fromEntity(entity);
    }

    return null;
  }

  static Future<TaskModel?> fromEntityPlus(TaskEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    var mapper = TaskModelRegistry.registry()!.getMapper(entity.identifier);
    if (mapper != null) {
      return mapper.fromEntityPlus(entity);
    }

    return null;
  }

  /*
   * Execute the task. Implement this method in your task
   */
  Future<void> startTask(BuildContext context, AssignmentModel? assignmentModel);

  /*
   * Finalise the task. Call this method from your execute upon success. This pattern, rather than a simple return value from your execute is
   * to allow asynchronous execution of your task(s).
   */
  Future<void> finishTask(BuildContext context, AssignmentModel assignmentModel,
      ExecutionResults executionResult, String? feedback) async {
    await _handleCurrentAssignment(
        context, assignmentModel, _isNewAssignment, executionResult);
    var state = AccessBloc.getState(context);
    if (state is AppLoaded) {
      if (state.getMember() != null) {
        var member = state.getMember();
        if (member != null) {
          if (executionResult.status == ExecutionStatus.success) {
            _sendMessage(context, assignmentModel.confirmMessage, state.app,
                member, assignmentModel, feedback);
            var nextAssignment = await _nextAssignment(
                context, assignmentModel, executionResult, member, state.app);
            if (nextAssignment != null) {
              // if the next assignment is assigned to the currently logged in member, then present it instantly:
              MemberModel? currentMember = AccessBloc.getState(context).getMember();
              if ((currentMember != null) &&
                  (nextAssignment.assigneeId == currentMember.documentID) &&
                  nextAssignment.task!.executeInstantly) {
                nextAssignment.task!.callExecute(context, nextAssignment, false,
                    finaliseWorkflow: _finaliseWorkflow);
              }
            }
          } else {
            _sendMessage(context, assignmentModel.rejectMessage, state.app,
                member, assignmentModel, feedback);
          }
        }
      }
    }
    if ((_finaliseWorkflow != null)) {
      _finaliseWorkflow!(
          executionResult.status == ExecutionStatus.success, assignmentModel);
    }
  }

  /* This method is called by the workflow framework */
  void callExecute(BuildContext context, AssignmentModel? assignmentModel,
      bool isNewAssignment,
      {FinaliseWorkflow? finaliseWorkflow}) {
    _isNewAssignment = isNewAssignment;
    _finaliseWorkflow = finaliseWorkflow;
    startTask(context, assignmentModel);
  }

  Future<void> _handleCurrentAssignment(
      BuildContext context,
      AssignmentModel assignmentModel,
      bool? isNewAssignment,
      ExecutionResults executionResult) async {
    var assignmentStatus;
    switch (executionResult.status) {
      case ExecutionStatus.success:
        assignmentStatus = AssignmentStatus.Success;
        break;
      case ExecutionStatus.decline:
        assignmentStatus = AssignmentStatus.Declined;
        break;
    }
    assignmentModel.resultsCurrent = executionResult.results;
    if (assignmentStatus != null) {
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
  }

  Future<void> _sendMessage(
      BuildContext context,
      WorkflowNotificationModel? workflowNotificationModel,
      AppModel app,
      MemberModel member,
      AssignmentModel currentAssignment,
      String? feedback) async {
    if (workflowNotificationModel != null) {
      var message = workflowNotificationModel.message;
      if (feedback != null) {
        message = message! + " " + feedback;
      }
      var addressee = workflowNotificationModel.addressee;
      String? to = await (DetermineMemberHelper
          .determineMemberWithWorkflowNotificationAddressee(
              addressee, app, member, currentAssignment));
      if (to == null) {
        print("error can't determing addressee to send message");
      } else {
        AbstractNotificationPlatform.platform!.sendMessage(
            context, to, message!);
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
            reporter: member,
            assigneeId: await DetermineMemberHelper
                .determineMemberWithWorkflowTaskResponsible(
                    nextTask.responsible, app, member, currentAssignment),
            task: nextTask.task,
            workflow: currentAssignment.workflow,
            status: AssignmentStatus.Open,
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
  }
}
