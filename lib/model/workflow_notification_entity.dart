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
import 'package:eliud_core/core/base/entity_base.dart';

class WorkflowNotificationEntity implements EntityBase {
  final String? message;
  final int? addressee;

  WorkflowNotificationEntity({this.message, this.addressee, });

  WorkflowNotificationEntity copyWith({String? message, int? addressee, }) {
    return WorkflowNotificationEntity(message : message ?? this.message, addressee : addressee ?? this.addressee, );
  }
  List<Object?> get props => [message, addressee, ];

  @override
  String toString() {
    return 'WorkflowNotificationEntity{message: $message, addressee: $addressee}';
  }

  static WorkflowNotificationEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
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

  @override
  WorkflowNotificationEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static WorkflowNotificationEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

