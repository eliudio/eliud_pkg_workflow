/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/random.dart';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class AssignmentEntity implements EntityBase {
  final String? appId;
  final String? reporterId;
  final String? assigneeId;
  final TaskEntity? task;
  final String? workflowId;
  final int? workflowTaskSeqNumber;
  final Object? timestamp;
  final int? status;
  final List<AssignmentResultEntity>? resultsCurrent;
  final List<AssignmentResultEntity>? resultsPrevious;
  final String? triggeredById;
  final WorkflowNotificationEntity? confirmMessage;
  final WorkflowNotificationEntity? rejectMessage;

  AssignmentEntity({required this.appId, required this.reporterId, this.assigneeId, this.task, this.workflowId, this.workflowTaskSeqNumber, this.timestamp, this.status, this.resultsCurrent, this.resultsPrevious, this.triggeredById, this.confirmMessage, this.rejectMessage, });

  AssignmentEntity copyWith({String? documentID, String? appId, String? reporterId, String? assigneeId, TaskEntity? task, String? workflowId, int? workflowTaskSeqNumber, Object? timestamp, int? status, List<AssignmentResultEntity>? resultsCurrent, List<AssignmentResultEntity>? resultsPrevious, String? triggeredById, WorkflowNotificationEntity? confirmMessage, WorkflowNotificationEntity? rejectMessage, }) {
    return AssignmentEntity(appId : appId ?? this.appId, reporterId : reporterId ?? this.reporterId, assigneeId : assigneeId ?? this.assigneeId, task : task ?? this.task, workflowId : workflowId ?? this.workflowId, workflowTaskSeqNumber : workflowTaskSeqNumber ?? this.workflowTaskSeqNumber, timestamp : timestamp ?? this.timestamp, status : status ?? this.status, resultsCurrent : resultsCurrent ?? this.resultsCurrent, resultsPrevious : resultsPrevious ?? this.resultsPrevious, triggeredById : triggeredById ?? this.triggeredById, confirmMessage : confirmMessage ?? this.confirmMessage, rejectMessage : rejectMessage ?? this.rejectMessage, );
  }
  List<Object?> get props => [appId, reporterId, assigneeId, task, workflowId, workflowTaskSeqNumber, timestamp, status, resultsCurrent, resultsPrevious, triggeredById, confirmMessage, rejectMessage, ];

  @override
  String toString() {
    String resultsCurrentCsv = (resultsCurrent == null) ? '' : resultsCurrent!.join(', ');
    String resultsPreviousCsv = (resultsPrevious == null) ? '' : resultsPrevious!.join(', ');

    return 'AssignmentEntity{appId: $appId, reporterId: $reporterId, assigneeId: $assigneeId, task: $task, workflowId: $workflowId, workflowTaskSeqNumber: $workflowTaskSeqNumber, timestamp: $timestamp, status: $status, resultsCurrent: AssignmentResult[] { $resultsCurrentCsv }, resultsPrevious: AssignmentResult[] { $resultsPreviousCsv }, triggeredById: $triggeredById, confirmMessage: $confirmMessage, rejectMessage: $rejectMessage}';
  }

  static AssignmentEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var taskFromMap;
    taskFromMap = map['task'];
    if (taskFromMap != null)
      taskFromMap = TaskEntity.fromMap(taskFromMap, newDocumentIds: newDocumentIds);
    var resultsCurrentFromMap;
    resultsCurrentFromMap = map['resultsCurrent'];
    var resultsCurrentList;
    if (resultsCurrentFromMap != null)
      resultsCurrentList = (map['resultsCurrent'] as List<dynamic>)
        .map((dynamic item) =>
        AssignmentResultEntity.fromMap(item as Map, newDocumentIds: newDocumentIds)!)
        .toList();
    var resultsPreviousFromMap;
    resultsPreviousFromMap = map['resultsPrevious'];
    var resultsPreviousList;
    if (resultsPreviousFromMap != null)
      resultsPreviousList = (map['resultsPrevious'] as List<dynamic>)
        .map((dynamic item) =>
        AssignmentResultEntity.fromMap(item as Map, newDocumentIds: newDocumentIds)!)
        .toList();
    var confirmMessageFromMap;
    confirmMessageFromMap = map['confirmMessage'];
    if (confirmMessageFromMap != null)
      confirmMessageFromMap = WorkflowNotificationEntity.fromMap(confirmMessageFromMap, newDocumentIds: newDocumentIds);
    var rejectMessageFromMap;
    rejectMessageFromMap = map['rejectMessage'];
    if (rejectMessageFromMap != null)
      rejectMessageFromMap = WorkflowNotificationEntity.fromMap(rejectMessageFromMap, newDocumentIds: newDocumentIds);

    return AssignmentEntity(
      appId: map['appId'], 
      reporterId: map['reporterId'], 
      assigneeId: map['assigneeId'], 
      task: taskFromMap, 
      workflowId: map['workflowId'], 
      workflowTaskSeqNumber: int.tryParse(map['workflowTaskSeqNumber'].toString()), 
      timestamp: map['timestamp'] == null ? null : (map['timestamp']  as Timestamp).millisecondsSinceEpoch,
      status: map['status'], 
      resultsCurrent: resultsCurrentList, 
      resultsPrevious: resultsPreviousList, 
      triggeredById: map['triggeredById'], 
      confirmMessage: confirmMessageFromMap, 
      rejectMessage: rejectMessageFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? taskMap = task != null 
        ? task!.toDocument()
        : null;
    final List<Map<String?, dynamic>>? resultsCurrentListMap = resultsCurrent != null 
        ? resultsCurrent!.map((item) => item.toDocument()).toList()
        : null;
    final List<Map<String?, dynamic>>? resultsPreviousListMap = resultsPrevious != null 
        ? resultsPrevious!.map((item) => item.toDocument()).toList()
        : null;
    final Map<String, dynamic>? confirmMessageMap = confirmMessage != null 
        ? confirmMessage!.toDocument()
        : null;
    final Map<String, dynamic>? rejectMessageMap = rejectMessage != null 
        ? rejectMessage!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (reporterId != null) theDocument["reporterId"] = reporterId;
      else theDocument["reporterId"] = null;
    if (assigneeId != null) theDocument["assigneeId"] = assigneeId;
      else theDocument["assigneeId"] = null;
    if (task != null) theDocument["task"] = taskMap;
      else theDocument["task"] = null;
    if (workflowId != null) theDocument["workflowId"] = workflowId;
      else theDocument["workflowId"] = null;
    if (workflowTaskSeqNumber != null) theDocument["workflowTaskSeqNumber"] = workflowTaskSeqNumber;
      else theDocument["workflowTaskSeqNumber"] = null;
    theDocument["timestamp"] = timestamp;
    if (status != null) theDocument["status"] = status;
      else theDocument["status"] = null;
    if (resultsCurrent != null) theDocument["resultsCurrent"] = resultsCurrentListMap;
      else theDocument["resultsCurrent"] = null;
    if (resultsPrevious != null) theDocument["resultsPrevious"] = resultsPreviousListMap;
      else theDocument["resultsPrevious"] = null;
    if (triggeredById != null) theDocument["triggeredById"] = triggeredById;
      else theDocument["triggeredById"] = null;
    if (confirmMessage != null) theDocument["confirmMessage"] = confirmMessageMap;
      else theDocument["confirmMessage"] = null;
    if (rejectMessage != null) theDocument["rejectMessage"] = rejectMessageMap;
      else theDocument["rejectMessage"] = null;
    return theDocument;
  }

  @override
  AssignmentEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static AssignmentEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

