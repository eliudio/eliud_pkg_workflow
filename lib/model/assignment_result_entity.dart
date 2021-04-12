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
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

class AssignmentResultEntity {
  final String? key;
  final String? value;

  AssignmentResultEntity({this.key, this.value, });


  List<Object?> get props => [key, value, ];

  @override
  String toString() {
    return 'AssignmentResultEntity{key: $key, value: $value}';
  }

  static AssignmentResultEntity? fromMap(Map? map) {
    if (map == null) return null;

    return AssignmentResultEntity(
      key: map['key'], 
      value: map['value'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (key != null) theDocument["key"] = key;
      else theDocument["key"] = null;
    if (value != null) theDocument["value"] = value;
      else theDocument["value"] = null;
    return theDocument;
  }

  static AssignmentResultEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

