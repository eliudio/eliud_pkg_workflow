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

enum WorkflowTaskResponsible {
  CurrentMember, Owner, First, Previous, Unknown
}


WorkflowTaskResponsible toWorkflowTaskResponsible(int index) {
  switch (index) {
    case 0: return WorkflowTaskResponsible.CurrentMember;
    case 1: return WorkflowTaskResponsible.Owner;
    case 2: return WorkflowTaskResponsible.First;
    case 3: return WorkflowTaskResponsible.Previous;
  }
  return WorkflowTaskResponsible.Unknown;
}


class WorkflowTaskModel {
  String documentID;
  TaskModel task;

  // Who's responsible to do this task? The workflow logic will use the current member, the owner of the app, or the initiator of the workflow as the assignee of the assignment
  WorkflowTaskResponsible responsible;

  WorkflowTaskModel({this.documentID, this.task, this.responsible, })  {
    assert(documentID != null);
  }

  WorkflowTaskModel copyWith({String documentID, TaskModel task, WorkflowTaskResponsible responsible, }) {
    return WorkflowTaskModel(documentID: documentID ?? this.documentID, task: task ?? this.task, responsible: responsible ?? this.responsible, );
  }

  @override
  int get hashCode => documentID.hashCode ^ task.hashCode ^ responsible.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is WorkflowTaskModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          task == other.task &&
          responsible == other.responsible;

  @override
  String toString() {
    return 'WorkflowTaskModel{documentID: $documentID, task: $task, responsible: $responsible}';
  }

  WorkflowTaskEntity toEntity({String appId}) {
    return WorkflowTaskEntity(
          task: (task != null) ? task.toEntity(appId: appId) : null, 
          responsible: (responsible != null) ? responsible.index : null, 
    );
  }

  static WorkflowTaskModel fromEntity(String documentID, WorkflowTaskEntity entity) {
    if (entity == null) return null;
    return WorkflowTaskModel(
          documentID: documentID, 
          task: 
            TaskModel.fromEntity(entity.task), 
          responsible: toWorkflowTaskResponsible(entity.responsible), 
    );
  }

  static Future<WorkflowTaskModel> fromEntityPlus(String documentID, WorkflowTaskEntity entity, { String appId}) async {
    if (entity == null) return null;

    return WorkflowTaskModel(
          documentID: documentID, 
          task: 
            await TaskModel.fromEntityPlus(entity.task, appId: appId), 
          responsible: toWorkflowTaskResponsible(entity.responsible), 
    );
  }

}

