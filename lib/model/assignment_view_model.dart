/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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


import 'package:eliud_pkg_workflow/model/assignment_view_entity.dart';

import 'package:eliud_core/tools/random.dart';



class AssignmentViewModel {
  String? documentID;
  String? appId;
  String? title;
  String? description;
  StorageConditionsModel? conditions;

  AssignmentViewModel({this.documentID, this.appId, this.title, this.description, this.conditions, })  {
    assert(documentID != null);
  }

  AssignmentViewModel copyWith({String? documentID, String? appId, String? title, String? description, StorageConditionsModel? conditions, }) {
    return AssignmentViewModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, description: description ?? this.description, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ description.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is AssignmentViewModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          description == other.description &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'AssignmentViewModel{documentID: $documentID, appId: $appId, title: $title, description: $description, conditions: $conditions}';
  }

  AssignmentViewEntity toEntity({String? appId}) {
    return AssignmentViewEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          description: (description != null) ? description : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<AssignmentViewModel?> fromEntity(String documentID, AssignmentViewEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return AssignmentViewModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          description: entity.description, 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<AssignmentViewModel?> fromEntityPlus(String documentID, AssignmentViewEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return AssignmentViewModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          description: entity.description, 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

