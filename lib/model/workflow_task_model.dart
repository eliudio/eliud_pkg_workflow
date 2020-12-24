/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_task_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';


import 'package:eliud_pkg_workflow/model/workflow_task_entity.dart';

import 'package:eliud_core/tools/random.dart';



class WorkflowTaskModel {
  String documentID;
  TaskModel task;

  WorkflowTaskModel({this.documentID, this.task, })  {
    assert(documentID != null);
  }

  WorkflowTaskModel copyWith({String documentID, TaskModel task, }) {
    return WorkflowTaskModel(documentID: documentID ?? this.documentID, task: task ?? this.task, );
  }

  @override
  int get hashCode => documentID.hashCode ^ task.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is WorkflowTaskModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          task == other.task;

  @override
  String toString() {
    return 'WorkflowTaskModel{documentID: $documentID, task: $task}';
  }

  WorkflowTaskEntity toEntity({String appId}) {
    return WorkflowTaskEntity(
          task: (task != null) ? task.toEntity(appId: appId) : null, 
    );
  }

  static WorkflowTaskModel fromEntity(String documentID, WorkflowTaskEntity entity) {
    if (entity == null) return null;
    return WorkflowTaskModel(
          documentID: documentID, 
          task: 
            TaskModel.fromEntity(entity.task), 
    );
  }

  static Future<WorkflowTaskModel> fromEntityPlus(String documentID, WorkflowTaskEntity entity, { String appId}) async {
    if (entity == null) return null;

    return WorkflowTaskModel(
          documentID: documentID, 
          task: 
            await TaskModel.fromEntityPlus(entity.task, appId: appId), 
    );
  }

}

