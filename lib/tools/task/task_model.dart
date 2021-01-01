import 'dart:collection';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_model.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_model.dart';
import 'package:eliud_pkg_workflow/tools/task/task_entity.dart';
import 'package:flutter/cupertino.dart';

enum ExecutionStatus { success, failure, decline, delay }
typedef void FinaliseWorkflow(bool success, AssignmentModel assignmentModel);

class ExecutionResults {
  final ExecutionStatus status;
  final List<AssignmentResultModel> results;

  ExecutionResults(this.status, {this.results});
}

class TaskModelRegistry {
  final Map<String, TaskModelMapper> mappers = HashMap();
  static TaskModelRegistry _instance;

  TaskModelRegistry._internal();

  static TaskModelRegistry registry() {
    _instance ??= TaskModelRegistry._internal();

    return _instance;
  }

  void addMapper(String taskString, TaskModelMapper mapper) {
    mappers[taskString] = mapper;
  }

  TaskModelMapper getMapper(String taskString) {
    return mappers[taskString];
  }
}

abstract class TaskModelMapper {
  TaskModel fromEntity(TaskEntity entity);
  TaskModel fromEntityPlus(TaskEntity entity);
  TaskEntity fromMap(Map snap);
}

abstract class TaskModel {
  final String description;
  final bool executeInstantly; // Execute instantly? When a triggering assignment has been finalised by a member and when the next assignment is also assigned to this member, then it will be executed instantly when set",

  bool _isNewAssignment;
  FinaliseWorkflow _finaliseWorkflow;

  TaskModel({this.description, this.executeInstantly});

  TaskEntity toEntity({String appId});

  static TaskModel fromEntity(TaskEntity entity) {
    if (entity == null) return null;

    var mapper = TaskModelRegistry.registry().getMapper(entity.taskString);
    if (mapper != null) {
      return mapper.fromEntity(entity);
    }

    return null;
  }

  static Future<TaskModel> fromEntityPlus(TaskEntity entity, {String appId}) async {
    if (entity == null) return null;

    var mapper = TaskModelRegistry.registry().getMapper(entity.taskString);
    if (mapper != null) {
      return mapper.fromEntityPlus(entity);
    }

    return null;
  }

  /*
   * Execute the task. Implement this method in your task
   */
  Future<void> startTask(BuildContext context, AssignmentModel assignmentModel);

  /*
   * Finalise the task. Call this method from your execute upon success. This pattern, rather than a simple return value from your execute is
   * to allow asynchronous execution of your task(s).
   */
  Future<void> finishTask(BuildContext context, AssignmentModel assignmentModel, ExecutionResults executionResult) async {
    await _handleCurrentAssignment(context, assignmentModel, _isNewAssignment, executionResult);
    if (executionResult.status == ExecutionStatus.success) {
      var nextAssignment = await _createNextAssignment(context, assignmentModel, executionResult);

      if (nextAssignment != null) {
        // if the next assignment is assigned to the currently logged in member, then present it instantly:
        MemberModel currentMember = AccessBloc.getState(context).getMember();
        if ((currentMember != null) &&
            (nextAssignment.assigneeId == currentMember.documentID) && (nextAssignment.task.executeInstantly != null) && (nextAssignment.task.executeInstantly)) {
          nextAssignment.task.callExecute(context, nextAssignment, false, finaliseWorkflow: _finaliseWorkflow);
        }
      }
    }
    if ((_finaliseWorkflow != null)) {
      _finaliseWorkflow(executionResult.status == ExecutionStatus.success, assignmentModel);
    }
  }

  /* This method is called by the workflow framework */
  void callExecute(BuildContext context, AssignmentModel assignmentModel, bool isNewAssignment, {FinaliseWorkflow finaliseWorkflow}) {
    _isNewAssignment = isNewAssignment;
    _finaliseWorkflow = finaliseWorkflow;
    startTask(context, assignmentModel);
  }

  Future<void> _handleCurrentAssignment(BuildContext context, AssignmentModel assignmentModel, bool isNewAssignment, ExecutionResults executionResult) async {
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
      if (isNewAssignment) {
        await AbstractRepositorySingleton.singleton.assignmentRepository(
            assignmentModel.appId)
            .add(assignmentModel);
      } else {
        await AbstractRepositorySingleton.singleton
            .assignmentRepository(assignmentModel.appId)
            .update(assignmentModel);
      }
    }
  }

  Future<String> _determineMember(WorkflowTaskResponsible workflowTaskResponsible, AppModel app, MemberModel member, AssignmentModel currentAssignment) async {
    switch (workflowTaskResponsible) {
      case WorkflowTaskResponsible.CurrentMember:
        return member.documentID;
      case WorkflowTaskResponsible.Owner:
        return app.ownerID;
      case WorkflowTaskResponsible.First:
        var findAssignment = currentAssignment;
        var assigneeId;
        while (findAssignment.triggeredById != null) {
          assigneeId = findAssignment.assigneeId;
          findAssignment = await assignmentRepository(appId: app.documentID).get(findAssignment.triggeredById);
        }
        return assigneeId;
      case WorkflowTaskResponsible.Previous:
        if (currentAssignment.triggeredById != null) {
          var triggeredBy = await assignmentRepository(appId: app.documentID).get(currentAssignment.triggeredById);
          return triggeredBy.assigneeId;
        }
        break;
    }
    return null;
  }

  Future<AssignmentModel> _createNextAssignment(BuildContext context, AssignmentModel currentAssignment, ExecutionResults executionResult) async {
    if (executionResult.status == ExecutionStatus.success) {
      var state = AccessBloc.getState(context);
      if (state is AppLoaded) {
        if (state.getMember() != null) {
          var member = state.getMember();

          var tasks = currentAssignment.workflow.workflowTask;
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
              var nextAssignment = AssignmentModel(
                  documentID: newRandomKey(),
                  appId: currentAssignment.appId,
                  reporter: member,
                  assigneeId: await _determineMember(nextTask.responsible, state.app, member, currentAssignment),
                  task: nextTask.task,
                  workflow: currentAssignment.workflow,
                  status: AssignmentStatus.Open,
                  triggeredById: currentAssignment.documentID,
                  workflowTaskSeqNumber: currentAssignment.workflow.workflowTask[found + 1].seqNumber,
                  resultsPrevious: executionResult.results);
              return await AbstractRepositorySingleton.singleton
                  .assignmentRepository(currentAssignment.appId)
                  .add(nextAssignment);
            } else {
              // no next task to do
            }
          } else {
            // task not found: error in workflow
          }
        }
      }
    }
    return null;
  }
}

class ExampleTaskModel1 extends TaskModel {
  final String extraParameter;

  ExampleTaskModel1({this.extraParameter, String description, bool executeInstantly}) : super(description: description, executeInstantly: executeInstantly);

  @override
  TaskEntity toEntity({String appId}) {
    return ExampleTaskEntity1(description: description, executeInstantly: executeInstantly);
  }

  static ExampleTaskModel1 fromEntity(ExampleTaskEntity1 entity) => ExampleTaskModel1(extraParameter: entity.extraParameter, description: entity.description, executeInstantly: entity.executeInstantly);
  static ExampleTaskEntity1 fromMap(Map snap) => ExampleTaskEntity1(extraParameter: snap["extraParameter"], description: snap["description"], executeInstantly: snap["executeInstantly"]);

  @override
  Future<void> startTask(BuildContext context, AssignmentModel assignmentModel) {
    throw UnimplementedError();
  }
}

class ExampleTaskModel1Mapper implements TaskModelMapper {
  @override
  TaskModel fromEntity(TaskEntity entity) => ExampleTaskModel1.fromEntity(entity);

  @override
  TaskModel fromEntityPlus(TaskEntity entity) => fromEntity(entity);

  @override
  TaskEntity fromMap(Map map) => ExampleTaskModel1.fromMap(map);

}