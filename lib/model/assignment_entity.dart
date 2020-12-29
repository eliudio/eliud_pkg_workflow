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
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

class AssignmentEntity {
  final String appId;
  final String reporterId;
  final String assigneeId;
  final TaskEntity task;
  final String workflowId;
  final int workflowTaskSeqNumber;
  final Object timestamp;
  final int status;
  final List<AssignmentResultEntity> resultsPrevious;
  final String triggeredById;

  AssignmentEntity({this.appId, this.reporterId, this.assigneeId, this.task, this.workflowId, this.workflowTaskSeqNumber, this.timestamp, this.status, this.resultsPrevious, this.triggeredById, });

  AssignmentEntity copyWith({Object timestamp, }) {
    return AssignmentEntity(appId: appId, reporterId: reporterId, assigneeId: assigneeId, task: task, workflowId: workflowId, workflowTaskSeqNumber: workflowTaskSeqNumber, timestamp : timestamp, status: status, resultsPrevious: resultsPrevious, triggeredById: triggeredById, );
  }
  List<Object> get props => [appId, reporterId, assigneeId, task, workflowId, workflowTaskSeqNumber, timestamp, status, resultsPrevious, triggeredById, ];

  @override
  String toString() {
    String resultsPreviousCsv = (resultsPrevious == null) ? '' : resultsPrevious.join(', ');

    return 'AssignmentEntity{appId: $appId, reporterId: $reporterId, assigneeId: $assigneeId, task: $task, workflowId: $workflowId, workflowTaskSeqNumber: $workflowTaskSeqNumber, timestamp: $timestamp, status: $status, resultsPrevious: AssignmentResult[] { $resultsPreviousCsv }, triggeredById: $triggeredById}';
  }

  static AssignmentEntity fromMap(Map map) {
    if (map == null) return null;

    var taskFromMap;
    taskFromMap = map['task'];
    if (taskFromMap != null)
      taskFromMap = TaskEntity.fromMap(taskFromMap);
    var resultsPreviousFromMap;
    resultsPreviousFromMap = map['resultsPrevious'];
    var resultsPreviousList;
    if (resultsPreviousFromMap != null)
      resultsPreviousList = (map['resultsPrevious'] as List<dynamic>)
        .map((dynamic item) =>
        AssignmentResultEntity.fromMap(item as Map))
        .toList();

    return AssignmentEntity(
      appId: map['appId'], 
      reporterId: map['reporterId'], 
      assigneeId: map['assigneeId'], 
      task: taskFromMap, 
      workflowId: map['workflowId'], 
      workflowTaskSeqNumber: int.tryParse(map['workflowTaskSeqNumber'].toString()), 
      timestamp: assignmentRepository().timeStampToString(map['timestamp']), 
      status: map['status'], 
      resultsPrevious: resultsPreviousList, 
      triggeredById: map['triggeredById'], 
    );
  }

  Map<String, Object> toDocument() {
    final Map<String, dynamic> taskMap = task != null 
        ? task.toDocument()
        : null;
    final List<Map<String, dynamic>> resultsPreviousListMap = resultsPrevious != null 
        ? resultsPrevious.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object> theDocument = HashMap();
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
    if (resultsPrevious != null) theDocument["resultsPrevious"] = resultsPreviousListMap;
      else theDocument["resultsPrevious"] = null;
    if (triggeredById != null) theDocument["triggeredById"] = triggeredById;
      else theDocument["triggeredById"] = null;
    return theDocument;
  }

  static AssignmentEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

