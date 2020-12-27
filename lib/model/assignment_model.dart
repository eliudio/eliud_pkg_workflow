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



class AssignmentModel {
  String documentID;

  // This is the identifier of the app to which this feed belongs
  String appId;
  MemberModel reporter;
  MemberModel assignee;
  TaskModel task;
  WorkflowModel workflow;
  String timestamp;
  List<AssignmentResultModel> results;
  AssignmentModel triggeredBy;

  AssignmentModel({this.documentID, this.appId, this.reporter, this.assignee, this.task, this.workflow, this.timestamp, this.results, this.triggeredBy, })  {
    assert(documentID != null);
  }

  AssignmentModel copyWith({String documentID, String appId, MemberModel reporter, MemberModel assignee, TaskModel task, WorkflowModel workflow, String timestamp, List<AssignmentResultModel> results, AssignmentModel triggeredBy, }) {
    return AssignmentModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, reporter: reporter ?? this.reporter, assignee: assignee ?? this.assignee, task: task ?? this.task, workflow: workflow ?? this.workflow, timestamp: timestamp ?? this.timestamp, results: results ?? this.results, triggeredBy: triggeredBy ?? this.triggeredBy, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ reporter.hashCode ^ assignee.hashCode ^ task.hashCode ^ workflow.hashCode ^ timestamp.hashCode ^ results.hashCode ^ triggeredBy.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is AssignmentModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          reporter == other.reporter &&
          assignee == other.assignee &&
          task == other.task &&
          workflow == other.workflow &&
          timestamp == other.timestamp &&
          ListEquality().equals(results, other.results) &&
          triggeredBy == other.triggeredBy;

  @override
  String toString() {
    String resultsCsv = (results == null) ? '' : results.join(', ');

    return 'AssignmentModel{documentID: $documentID, appId: $appId, reporter: $reporter, assignee: $assignee, task: $task, workflow: $workflow, timestamp: $timestamp, results: AssignmentResult[] { $resultsCsv }, triggeredBy: $triggeredBy}';
  }

  AssignmentEntity toEntity({String appId}) {
    return AssignmentEntity(
          appId: (appId != null) ? appId : null, 
          reporterId: (reporter != null) ? reporter.documentID : null, 
          assigneeId: (assignee != null) ? assignee.documentID : null, 
          task: (task != null) ? task.toEntity(appId: appId) : null, 
          workflowId: (workflow != null) ? workflow.documentID : null, 
          timestamp: timestamp,           results: (results != null) ? results
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
          task: 
            TaskModel.fromEntity(entity.task), 
          timestamp: entity.timestamp, 
          results: 
            entity. results
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

    MemberModel assigneeHolder;
    if (entity.assigneeId != null) {
      try {
        await memberRepository(appId: appId).get(entity.assigneeId).then((val) {
          assigneeHolder = val;
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
          assignee: assigneeHolder, 
          task: 
            await TaskModel.fromEntityPlus(entity.task, appId: appId), 
          workflow: workflowHolder, 
          timestamp: entity.timestamp, 
          results: 
            new List<AssignmentResultModel>.from(await Future.wait(entity. results
            .map((item) => AssignmentResultModel.fromEntityPlus(newRandomKey(), item, appId: appId))
            .toList())), 
          triggeredBy: triggeredByHolder, 
    );
  }

}

