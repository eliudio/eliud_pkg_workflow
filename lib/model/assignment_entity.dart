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
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

class AssignmentEntity {
  final String appId;
  final String reporterId;
  final String assigneeId;
  final TaskEntity task;
  final String workflowId;
  final String triggeringAssignmentId;
  final Object timestamp;
  final List<AssignmentResultEntity> results;

  AssignmentEntity({this.appId, this.reporterId, this.assigneeId, this.task, this.workflowId, this.triggeringAssignmentId, this.timestamp, this.results, });

  AssignmentEntity copyWith({Object timestamp, }) {
    return AssignmentEntity(appId: appId, reporterId: reporterId, assigneeId: assigneeId, task: task, workflowId: workflowId, triggeringAssignmentId: triggeringAssignmentId, timestamp : timestamp, results: results, );
  }
  List<Object> get props => [appId, reporterId, assigneeId, task, workflowId, triggeringAssignmentId, timestamp, results, ];

  @override
  String toString() {
    String resultsCsv = (results == null) ? '' : results.join(', ');

    return 'AssignmentEntity{appId: $appId, reporterId: $reporterId, assigneeId: $assigneeId, task: $task, workflowId: $workflowId, triggeringAssignmentId: $triggeringAssignmentId, timestamp: $timestamp, results: AssignmentResult[] { $resultsCsv }}';
  }

  static AssignmentEntity fromMap(Map map) {
    if (map == null) return null;

    var taskFromMap;
    taskFromMap = map['task'];
    if (taskFromMap != null)
      taskFromMap = TaskEntity.fromMap(taskFromMap);
    final resultsList = (map['results'] as List<dynamic>)
        .map((dynamic item) =>
        AssignmentResultEntity.fromMap(item as Map))
        .toList();

    return AssignmentEntity(
      appId: map['appId'], 
      reporterId: map['reporterId'], 
      assigneeId: map['assigneeId'], 
      task: taskFromMap, 
      workflowId: map['workflowId'], 
      triggeringAssignmentId: map['triggeringAssignmentId'], 
      timestamp: map['timestamp']?.toDate(), 
      results: resultsList, 
    );
  }

  Map<String, Object> toDocument() {
    final Map<String, dynamic> taskMap = task != null 
        ? task.toDocument()
        : null;
    final List<Map<String, dynamic>> resultsListMap = results != null 
        ? results.map((item) => item.toDocument()).toList()
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
    if (triggeringAssignmentId != null) theDocument["triggeringAssignmentId"] = triggeringAssignmentId;
      else theDocument["triggeringAssignmentId"] = null;
    theDocument["timestamp"] = timestamp;
    if (results != null) theDocument["results"] = resultsListMap;
      else theDocument["results"] = null;
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

