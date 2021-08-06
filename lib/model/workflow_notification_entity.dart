/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_notification_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class WorkflowNotificationEntity {
  final String? message;
  final int? addressee;

  WorkflowNotificationEntity({this.message, this.addressee, });


  List<Object?> get props => [message, addressee, ];

  @override
  String toString() {
    return 'WorkflowNotificationEntity{message: $message, addressee: $addressee}';
  }

  static WorkflowNotificationEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return WorkflowNotificationEntity(
      message: map['message'], 
      addressee: map['addressee'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (message != null) theDocument["message"] = message;
      else theDocument["message"] = null;
    if (addressee != null) theDocument["addressee"] = addressee;
      else theDocument["addressee"] = null;
    return theDocument;
  }

  static WorkflowNotificationEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

