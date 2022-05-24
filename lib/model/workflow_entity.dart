/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class WorkflowEntity {
  final String? name;
  final List<WorkflowTaskEntity>? workflowTask;
  final String? appId;

  WorkflowEntity({this.name, this.workflowTask, required this.appId, });


  List<Object?> get props => [name, workflowTask, appId, ];

  @override
  String toString() {
    String workflowTaskCsv = (workflowTask == null) ? '' : workflowTask!.join(', ');

    return 'WorkflowEntity{name: $name, workflowTask: WorkflowTask[] { $workflowTaskCsv }, appId: $appId}';
  }

  static WorkflowEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var workflowTaskFromMap;
    workflowTaskFromMap = map['workflowTask'];
    var workflowTaskList;
    if (workflowTaskFromMap != null)
      workflowTaskList = (map['workflowTask'] as List<dynamic>)
        .map((dynamic item) =>
        WorkflowTaskEntity.fromMap(item as Map)!)
        .toList();

    return WorkflowEntity(
      name: map['name'], 
      workflowTask: workflowTaskList, 
      appId: map['appId'], 
    );
  }

  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? workflowTaskListMap = workflowTask != null 
        ? workflowTask!.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (workflowTask != null) theDocument["workflowTask"] = workflowTaskListMap;
      else theDocument["workflowTask"] = null;
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    return theDocument;
  }

  static WorkflowEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

