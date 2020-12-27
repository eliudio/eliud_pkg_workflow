/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_task_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

class WorkflowTaskEntity {
  final TaskEntity task;
  final int responsible;

  WorkflowTaskEntity({this.task, this.responsible, });


  List<Object> get props => [task, responsible, ];

  @override
  String toString() {
    return 'WorkflowTaskEntity{task: $task, responsible: $responsible}';
  }

  static WorkflowTaskEntity fromMap(Map map) {
    if (map == null) return null;

    var taskFromMap;
    taskFromMap = map['task'];
    if (taskFromMap != null)
      taskFromMap = TaskEntity.fromMap(taskFromMap);

    return WorkflowTaskEntity(
      task: taskFromMap, 
      responsible: map['responsible'], 
    );
  }

  Map<String, Object> toDocument() {
    final Map<String, dynamic> taskMap = task != null 
        ? task.toDocument()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (task != null) theDocument["task"] = taskMap;
      else theDocument["task"] = null;
    if (responsible != null) theDocument["responsible"] = responsible;
      else theDocument["responsible"] = null;
    return theDocument;
  }

  static WorkflowTaskEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

