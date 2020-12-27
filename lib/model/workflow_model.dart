/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_model.dart
                       
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


import 'package:eliud_pkg_workflow/model/workflow_entity.dart';

import 'package:eliud_core/tools/random.dart';



class WorkflowModel {
  String documentID;
  String name;
  List<WorkflowTaskModel> workflowTask;

  // This is the identifier of the app to which this feed belongs
  String appId;

  WorkflowModel({this.documentID, this.name, this.workflowTask, this.appId, })  {
    assert(documentID != null);
  }

  WorkflowModel copyWith({String documentID, String name, List<WorkflowTaskModel> workflowTask, String appId, }) {
    return WorkflowModel(documentID: documentID ?? this.documentID, name: name ?? this.name, workflowTask: workflowTask ?? this.workflowTask, appId: appId ?? this.appId, );
  }

  @override
  int get hashCode => documentID.hashCode ^ name.hashCode ^ workflowTask.hashCode ^ appId.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is WorkflowModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          name == other.name &&
          ListEquality().equals(workflowTask, other.workflowTask) &&
          appId == other.appId;

  @override
  String toString() {
    String workflowTaskCsv = (workflowTask == null) ? '' : workflowTask.join(', ');

    return 'WorkflowModel{documentID: $documentID, name: $name, workflowTask: WorkflowTask[] { $workflowTaskCsv }, appId: $appId}';
  }

  WorkflowEntity toEntity({String appId}) {
    return WorkflowEntity(
          name: (name != null) ? name : null, 
          workflowTask: (workflowTask != null) ? workflowTask
            .map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          appId: (appId != null) ? appId : null, 
    );
  }

  static WorkflowModel fromEntity(String documentID, WorkflowEntity entity) {
    if (entity == null) return null;
    return WorkflowModel(
          documentID: documentID, 
          name: entity.name, 
          workflowTask: 
            entity. workflowTask
            .map((item) => WorkflowTaskModel.fromEntity(newRandomKey(), item))
            .toList(), 
          appId: entity.appId, 
    );
  }

  static Future<WorkflowModel> fromEntityPlus(String documentID, WorkflowEntity entity, { String appId}) async {
    if (entity == null) return null;

    return WorkflowModel(
          documentID: documentID, 
          name: entity.name, 
          workflowTask: 
            new List<WorkflowTaskModel>.from(await Future.wait(entity. workflowTask
            .map((item) => WorkflowTaskModel.fromEntityPlus(newRandomKey(), item, appId: appId))
            .toList())), 
          appId: entity.appId, 
    );
  }

}
