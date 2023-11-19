/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_result_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef AssignmentResultModelTrigger = Function(
    List<AssignmentResultModel?> list);
typedef AssignmentResultChanged = Function(AssignmentResultModel? value);
typedef AssignmentResultErrorHandler = Function(dynamic o, dynamic e);

abstract class AssignmentResultRepository
    extends RepositoryBase<AssignmentResultModel, AssignmentResultEntity> {
  @override
  Future<AssignmentResultEntity> addEntity(
      String documentID, AssignmentResultEntity value);
  @override
  Future<AssignmentResultEntity> updateEntity(
      String documentID, AssignmentResultEntity value);
  @override
  Future<AssignmentResultModel> add(AssignmentResultModel value);
  @override
  Future<void> delete(AssignmentResultModel value);
  @override
  Future<AssignmentResultModel?> get(String? id,
      {Function(Exception)? onError});
  @override
  Future<AssignmentResultModel> update(AssignmentResultModel value);

  @override
  Stream<List<AssignmentResultModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<AssignmentResultModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<AssignmentResultModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<AssignmentResultModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<AssignmentResultModel?>> listen(
      AssignmentResultModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<AssignmentResultModel?>> listenWithDetails(
      AssignmentResultModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<AssignmentResultModel?> listenTo(
      String documentId, AssignmentResultChanged changed,
      {AssignmentResultErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<AssignmentResultModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
