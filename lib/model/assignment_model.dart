/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';


import 'package:eliud_pkg_workflow/model/assignment_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum AssignmentStatus {
  Success, Declined, Open, Unknown
}


AssignmentStatus toAssignmentStatus(int index) {
  switch (index) {
    case 0: return AssignmentStatus.Success;
    case 1: return AssignmentStatus.Declined;
    case 2: return AssignmentStatus.Open;
  }
  return AssignmentStatus.Unknown;
}


class AssignmentModel {
  String documentID;

  // This is the identifier of the app to which this feed belongs
  String appId;
  MemberModel reporter;
  String assigneeId;
  TaskModel task;
  WorkflowModel workflow;
  String timestamp;
  AssignmentStatus status;
  List<AssignmentResultModel> resultsFromPreviousAssignment;
  AssignmentModel triggeredBy;

  AssignmentModel({this.documentID, this.appId, this.reporter, this.assigneeId, this.task, this.workflow, this.timestamp, this.status, this.resultsFromPreviousAssignment, this.triggeredBy, })  {
    assert(documentID != null);
  }

  AssignmentModel copyWith({String documentID, String appId, MemberModel reporter, String assigneeId, TaskModel task, WorkflowModel workflow, String timestamp, AssignmentStatus status, List<AssignmentResultModel> resultsFromPreviousAssignment, AssignmentModel triggeredBy, }) {
    return AssignmentModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, reporter: reporter ?? this.reporter, assigneeId: assigneeId ?? this.assigneeId, task: task ?? this.task, workflow: workflow ?? this.workflow, timestamp: timestamp ?? this.timestamp, status: status ?? this.status, resultsFromPreviousAssignment: resultsFromPreviousAssignment ?? this.resultsFromPreviousAssignment, triggeredBy: triggeredBy ?? this.triggeredBy, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ reporter.hashCode ^ assigneeId.hashCode ^ task.hashCode ^ workflow.hashCode ^ timestamp.hashCode ^ status.hashCode ^ resultsFromPreviousAssignment.hashCode ^ triggeredBy.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is AssignmentModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          reporter == other.reporter &&
          assigneeId == other.assigneeId &&
          task == other.task &&
          workflow == other.workflow &&
          timestamp == other.timestamp &&
          status == other.status &&
          ListEquality().equals(resultsFromPreviousAssignment, other.resultsFromPreviousAssignment) &&
          triggeredBy == other.triggeredBy;

  @override
  String toString() {
    String resultsFromPreviousAssignmentCsv = (resultsFromPreviousAssignment == null) ? '' : resultsFromPreviousAssignment.join(', ');

    return 'AssignmentModel{documentID: $documentID, appId: $appId, reporter: $reporter, assigneeId: $assigneeId, task: $task, workflow: $workflow, timestamp: $timestamp, status: $status, resultsFromPreviousAssignment: AssignmentResult[] { $resultsFromPreviousAssignmentCsv }, triggeredBy: $triggeredBy}';
  }

  AssignmentEntity toEntity({String appId}) {
    return AssignmentEntity(
          appId: (appId != null) ? appId : null, 
          reporterId: (reporter != null) ? reporter.documentID : null, 
          assigneeId: (assigneeId != null) ? assigneeId : null, 
          task: (task != null) ? task.toEntity(appId: appId) : null, 
          workflowId: (workflow != null) ? workflow.documentID : null, 
          timestamp: timestamp,           status: (status != null) ? status.index : null, 
          resultsFromPreviousAssignment: (resultsFromPreviousAssignment != null) ? resultsFromPreviousAssignment
            .map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          triggeredById: (triggeredBy != null) ? triggeredBy.documentID : null, 
    );
  }

  static AssignmentModel fromEntity(String documentID, AssignmentEntity entity) {
    if (entity == null) return null;
    return AssignmentModel(
          documentID: documentID, 
          appId: entity.appId, 
          assigneeId: entity.assigneeId, 
          task: 
            TaskModel.fromEntity(entity.task), 
          timestamp: entity.timestamp, 
          status: toAssignmentStatus(entity.status), 
          resultsFromPreviousAssignment: 
            entity.resultsFromPreviousAssignment == null ? null :
            entity.resultsFromPreviousAssignment
            .map((item) => AssignmentResultModel.fromEntity(newRandomKey(), item))
            .toList(), 
    );
  }

  static Future<AssignmentModel> fromEntityPlus(String documentID, AssignmentEntity entity, { String appId}) async {
    if (entity == null) return null;

    MemberModel reporterHolder;
    if (entity.reporterId != null) {
      try {
        await memberRepository(appId: appId).get(entity.reporterId).then((val) {
          reporterHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    WorkflowModel workflowHolder;
    if (entity.workflowId != null) {
      try {
        await workflowRepository(appId: appId).get(entity.workflowId).then((val) {
          workflowHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    AssignmentModel triggeredByHolder;
    if (entity.triggeredById != null) {
      try {
        await assignmentRepository(appId: appId).get(entity.triggeredById).then((val) {
          triggeredByHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return AssignmentModel(
          documentID: documentID, 
          appId: entity.appId, 
          reporter: reporterHolder, 
          assigneeId: entity.assigneeId, 
          task: 
            await TaskModel.fromEntityPlus(entity.task, appId: appId), 
          workflow: workflowHolder, 
          timestamp: entity.timestamp, 
          status: toAssignmentStatus(entity.status), 
          resultsFromPreviousAssignment: 
            entity. resultsFromPreviousAssignment == null ? null : new List<AssignmentResultModel>.from(await Future.wait(entity. resultsFromPreviousAssignment
            .map((item) => AssignmentResultModel.fromEntityPlus(newRandomKey(), item, appId: appId))
            .toList())), 
          triggeredBy: triggeredByHolder, 
    );
  }

}

