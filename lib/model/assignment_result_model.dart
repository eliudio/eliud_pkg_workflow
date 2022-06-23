/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_result_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';


import 'package:eliud_pkg_workflow/model/assignment_result_entity.dart';

import 'package:eliud_core/tools/random.dart';



class AssignmentResultModel implements ModelBase {
  String documentID;
  String? key;
  String? value;

  AssignmentResultModel({required this.documentID, this.key, this.value, })  {
    assert(documentID != null);
  }

  AssignmentResultModel copyWith({String? documentID, String? key, String? value, }) {
    return AssignmentResultModel(documentID: documentID ?? this.documentID, key: key ?? this.key, value: value ?? this.value, );
  }

  @override
  int get hashCode => documentID.hashCode ^ key.hashCode ^ value.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is AssignmentResultModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          key == other.key &&
          value == other.value;

  @override
  String toString() {
    return 'AssignmentResultModel{documentID: $documentID, key: $key, value: $value}';
  }

  AssignmentResultEntity toEntity({String? appId, List<ModelBase>? referencesCollector}) {
    if (referencesCollector != null) {
    }
    return AssignmentResultEntity(
          key: (key != null) ? key : null, 
          value: (value != null) ? value : null, 
    );
  }

  static Future<AssignmentResultModel?> fromEntity(String documentID, AssignmentResultEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return AssignmentResultModel(
          documentID: documentID, 
          key: entity.key, 
          value: entity.value, 
    );
  }

  static Future<AssignmentResultModel?> fromEntityPlus(String documentID, AssignmentResultEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return AssignmentResultModel(
          documentID: documentID, 
          key: entity.key, 
          value: entity.value, 
    );
  }

}

