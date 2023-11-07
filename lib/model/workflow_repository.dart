/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef WorkflowModelTrigger = Function(List<WorkflowModel?> list);
typedef WorkflowChanged = Function(WorkflowModel? value);
typedef WorkflowErrorHandler = Function(dynamic o, dynamic e);

abstract class WorkflowRepository
    extends RepositoryBase<WorkflowModel, WorkflowEntity> {
  @override
  Future<WorkflowEntity> addEntity(String documentID, WorkflowEntity value);
  @override
  Future<WorkflowEntity> updateEntity(String documentID, WorkflowEntity value);
  @override
  Future<WorkflowModel> add(WorkflowModel value);
  @override
  Future<void> delete(WorkflowModel value);
  @override
  Future<WorkflowModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<WorkflowModel> update(WorkflowModel value);

  @override
  Stream<List<WorkflowModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<WorkflowModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<WorkflowModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<WorkflowModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<WorkflowModel?>> listen(WorkflowModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<WorkflowModel?>> listenWithDetails(
      WorkflowModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<WorkflowModel?> listenTo(
      String documentId, WorkflowChanged changed,
      {WorkflowErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<WorkflowModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
