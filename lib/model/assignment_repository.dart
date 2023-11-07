/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef AssignmentModelTrigger = Function(List<AssignmentModel?> list);
typedef AssignmentChanged = Function(AssignmentModel? value);
typedef AssignmentErrorHandler = Function(dynamic o, dynamic e);

abstract class AssignmentRepository
    extends RepositoryBase<AssignmentModel, AssignmentEntity> {
  @override
  Future<AssignmentEntity> addEntity(String documentID, AssignmentEntity value);
  @override
  Future<AssignmentEntity> updateEntity(
      String documentID, AssignmentEntity value);
  @override
  Future<AssignmentModel> add(AssignmentModel value);
  @override
  Future<void> delete(AssignmentModel value);
  @override
  Future<AssignmentModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<AssignmentModel> update(AssignmentModel value);

  @override
  Stream<List<AssignmentModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<AssignmentModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<AssignmentModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<AssignmentModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<AssignmentModel?>> listen(
      AssignmentModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<AssignmentModel?>> listenWithDetails(
      AssignmentModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<AssignmentModel?> listenTo(
      String documentId, AssignmentChanged changed,
      {AssignmentErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<AssignmentModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
