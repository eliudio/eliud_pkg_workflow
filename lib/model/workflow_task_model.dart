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

enum SourceImage {
  Owner, Myself, OtherMember, Unknown
}


SourceImage toSourceImage(int index) {
  switch (index) {
    case 0: return SourceImage.Owner;
    case 1: return SourceImage.Myself;
    case 2: return SourceImage.OtherMember;
  }
  return SourceImage.Unknown;
}


class WorkflowTaskModel {
  String documentID;

  // This task string corresponds to a class. This class can be a standard eliud_pkg_workflow action class or a plugin action.
  TaskModel task;
  SourceImage who;

  WorkflowTaskModel({this.documentID, this.task, this.who, })  {
    assert(documentID != null);
  }

  WorkflowTaskModel copyWith({String documentID, TaskModel task, SourceImage who, }) {
    return WorkflowTaskModel(documentID: documentID ?? this.documentID, task: task ?? this.task, who: who ?? this.who, );
  }

  @override
  int get hashCode => documentID.hashCode ^ task.hashCode ^ who.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is WorkflowTaskModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          task == other.task &&
          who == other.who;

  @override
  String toString() {
    return 'WorkflowTaskModel{documentID: $documentID, task: $task, who: $who}';
  }

  WorkflowTaskEntity toEntity({String appId}) {
    return WorkflowTaskEntity(
          task: (task != null) ? task.toEntity(appId: appId) : null, 
          who: (who != null) ? who.index : null, 
    );
  }

  static WorkflowTaskModel fromEntity(String documentID, WorkflowTaskEntity entity) {
    if (entity == null) return null;
    return WorkflowTaskModel(
          documentID: documentID, 
          task: 
            TaskModel.fromEntity(entity.task), 
          who: toSourceImage(entity.who), 
    );
  }

  static Future<WorkflowTaskModel> fromEntityPlus(String documentID, WorkflowTaskEntity entity, { String appId}) async {
    if (entity == null) return null;

    return WorkflowTaskModel(
          documentID: documentID, 
          task: 
            await TaskModel.fromEntityPlus(entity.task, appId: appId), 
          who: toSourceImage(entity.who), 
    );
  }

}

