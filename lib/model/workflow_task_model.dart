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

import 'package:eliud_core/core/base/model_base.dart';

import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';


import 'package:eliud_pkg_workflow/model/workflow_task_entity.dart';


enum WorkflowTaskResponsible {
  CurrentMember, Owner, First, Previous, Unknown
}


WorkflowTaskResponsible toWorkflowTaskResponsible(int? index) {
  switch (index) {
    case 0: return WorkflowTaskResponsible.CurrentMember;
    case 1: return WorkflowTaskResponsible.Owner;
    case 2: return WorkflowTaskResponsible.First;
    case 3: return WorkflowTaskResponsible.Previous;
  }
  return WorkflowTaskResponsible.Unknown;
}


class WorkflowTaskModel implements ModelBase {
  static const String packageName = 'eliud_pkg_workflow';
  static const String id = 'workflowTasks';

  String documentID;
  int? seqNumber;
  TaskModel? task;

  // Message to be sent after this task is completed successfully
  WorkflowNotificationModel? confirmMessage;

  // Message to be sent after this task is completed unsuccessfully
  WorkflowNotificationModel? rejectMessage;

  // Who's responsible to do this task? The workflow logic will use the current member, the owner of the app, or the initiator of the workflow as the assignee of the assignment
  WorkflowTaskResponsible? responsible;

  WorkflowTaskModel({required this.documentID, this.seqNumber, this.task, this.confirmMessage, this.rejectMessage, this.responsible, });

  WorkflowTaskModel copyWith({String? documentID, int? seqNumber, TaskModel? task, WorkflowNotificationModel? confirmMessage, WorkflowNotificationModel? rejectMessage, WorkflowTaskResponsible? responsible, }) {
    return WorkflowTaskModel(documentID: documentID ?? this.documentID, seqNumber: seqNumber ?? this.seqNumber, task: task ?? this.task, confirmMessage: confirmMessage ?? this.confirmMessage, rejectMessage: rejectMessage ?? this.rejectMessage, responsible: responsible ?? this.responsible, );
  }

  @override
  int get hashCode => documentID.hashCode ^ seqNumber.hashCode ^ task.hashCode ^ confirmMessage.hashCode ^ rejectMessage.hashCode ^ responsible.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is WorkflowTaskModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          seqNumber == other.seqNumber &&
          task == other.task &&
          confirmMessage == other.confirmMessage &&
          rejectMessage == other.rejectMessage &&
          responsible == other.responsible;

  @override
  String toString() {
    return 'WorkflowTaskModel{documentID: $documentID, seqNumber: $seqNumber, task: $task, confirmMessage: $confirmMessage, rejectMessage: $rejectMessage, responsible: $responsible}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (task != null) referencesCollector.addAll(await task!.collectReferences(appId: appId));
    if (confirmMessage != null) referencesCollector.addAll(await confirmMessage!.collectReferences(appId: appId));
    if (rejectMessage != null) referencesCollector.addAll(await rejectMessage!.collectReferences(appId: appId));
    return referencesCollector;
  }

  WorkflowTaskEntity toEntity({String? appId}) {
    return WorkflowTaskEntity(
          seqNumber: (seqNumber != null) ? seqNumber : null, 
          task: (task != null) ? task!.toEntity(appId: appId) : null, 
          confirmMessage: (confirmMessage != null) ? confirmMessage!.toEntity(appId: appId) : null, 
          rejectMessage: (rejectMessage != null) ? rejectMessage!.toEntity(appId: appId) : null, 
          responsible: (responsible != null) ? responsible!.index : null, 
    );
  }

  static Future<WorkflowTaskModel?> fromEntity(String documentID, WorkflowTaskEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return WorkflowTaskModel(
          documentID: documentID, 
          seqNumber: entity.seqNumber, 
          task: 
            TaskModel.fromEntity(entity.task), 
          confirmMessage: 
            await WorkflowNotificationModel.fromEntity(entity.confirmMessage), 
          rejectMessage: 
            await WorkflowNotificationModel.fromEntity(entity.rejectMessage), 
          responsible: toWorkflowTaskResponsible(entity.responsible), 
    );
  }

  static Future<WorkflowTaskModel?> fromEntityPlus(String documentID, WorkflowTaskEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return WorkflowTaskModel(
          documentID: documentID, 
          seqNumber: entity.seqNumber, 
          task: 
            await TaskModel.fromEntityPlus(entity.task, appId: appId), 
          confirmMessage: 
            await WorkflowNotificationModel.fromEntityPlus(entity.confirmMessage, appId: appId), 
          rejectMessage: 
            await WorkflowNotificationModel.fromEntityPlus(entity.rejectMessage, appId: appId), 
          responsible: toWorkflowTaskResponsible(entity.responsible), 
    );
  }

}

