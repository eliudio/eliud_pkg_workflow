/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_result_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';

class AssignmentResultEntity implements EntityBase {
  final String? key;
  final String? value;

  AssignmentResultEntity({
    this.key,
    this.value,
  });

  AssignmentResultEntity copyWith({
    String? documentID,
    String? key,
    String? value,
  }) {
    return AssignmentResultEntity(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  List<Object?> get props => [
        key,
        value,
      ];

  @override
  String toString() {
    return 'AssignmentResultEntity{key: $key, value: $value}';
  }

  static AssignmentResultEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return AssignmentResultEntity(
      key: map['key'],
      value: map['value'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (key != null) {
      theDocument["key"] = key;
    } else {
      theDocument["key"] = null;
    }
    if (value != null) {
      theDocument["value"] = value;
    } else {
      theDocument["value"] = null;
    }
    return theDocument;
  }

  @override
  AssignmentResultEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static AssignmentResultEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
