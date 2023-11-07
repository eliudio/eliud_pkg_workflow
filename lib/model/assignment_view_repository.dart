/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef AssignmentViewModelTrigger = Function(List<AssignmentViewModel?> list);
typedef AssignmentViewChanged = Function(AssignmentViewModel? value);
typedef AssignmentViewErrorHandler = Function(dynamic o, dynamic e);

abstract class AssignmentViewRepository
    extends RepositoryBase<AssignmentViewModel, AssignmentViewEntity> {
  @override
  Future<AssignmentViewEntity> addEntity(
      String documentID, AssignmentViewEntity value);
  @override
  Future<AssignmentViewEntity> updateEntity(
      String documentID, AssignmentViewEntity value);
  @override
  Future<AssignmentViewModel> add(AssignmentViewModel value);
  @override
  Future<void> delete(AssignmentViewModel value);
  @override
  Future<AssignmentViewModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<AssignmentViewModel> update(AssignmentViewModel value);

  @override
  Stream<List<AssignmentViewModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<AssignmentViewModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<AssignmentViewModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<AssignmentViewModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<AssignmentViewModel?>> listen(
      AssignmentViewModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<AssignmentViewModel?>> listenWithDetails(
      AssignmentViewModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<AssignmentViewModel?> listenTo(
      String documentId, AssignmentViewChanged changed,
      {AssignmentViewErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<AssignmentViewModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
