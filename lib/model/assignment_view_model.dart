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


import 'package:eliud_pkg_workflow/model/assignment_view_entity.dart';

import 'package:eliud_core/tools/random.dart';



class AssignmentViewModel {
  String documentID;
  String appId;
  String title;
  String description;

  AssignmentViewModel({this.documentID, this.appId, this.title, this.description, })  {
    assert(documentID != null);
  }

  AssignmentViewModel copyWith({String documentID, String appId, String title, String description, }) {
    return AssignmentViewModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, description: description ?? this.description, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ description.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is AssignmentViewModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          description == other.description;

  @override
  String toString() {
    return 'AssignmentViewModel{documentID: $documentID, appId: $appId, title: $title, description: $description}';
  }

  AssignmentViewEntity toEntity({String appId}) {
    return AssignmentViewEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          description: (description != null) ? description : null, 
    );
  }

  static AssignmentViewModel fromEntity(String documentID, AssignmentViewEntity entity) {
    if (entity == null) return null;
    return AssignmentViewModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          description: entity.description, 
    );
  }

  static Future<AssignmentViewModel> fromEntityPlus(String documentID, AssignmentViewEntity entity, { String appId}) async {
    if (entity == null) return null;

    return AssignmentViewModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          description: entity.description, 
    );
  }

}
