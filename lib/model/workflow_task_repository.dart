/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_task_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef WorkflowTaskModelTrigger = Function(List<WorkflowTaskModel?> list);
typedef WorkflowTaskChanged = Function(WorkflowTaskModel? value);
typedef WorkflowTaskErrorHandler = Function(dynamic o, dynamic e);

abstract class WorkflowTaskRepository
    extends RepositoryBase<WorkflowTaskModel, WorkflowTaskEntity> {
  @override
  Future<WorkflowTaskEntity> addEntity(
      String documentID, WorkflowTaskEntity value);
  @override
  Future<WorkflowTaskEntity> updateEntity(
      String documentID, WorkflowTaskEntity value);
  @override
  Future<WorkflowTaskModel> add(WorkflowTaskModel value);
  @override
  Future<void> delete(WorkflowTaskModel value);
  @override
  Future<WorkflowTaskModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<WorkflowTaskModel> update(WorkflowTaskModel value);

  @override
  Stream<List<WorkflowTaskModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<WorkflowTaskModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<WorkflowTaskModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<WorkflowTaskModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<WorkflowTaskModel?>> listen(
      WorkflowTaskModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<WorkflowTaskModel?>> listenWithDetails(
      WorkflowTaskModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<WorkflowTaskModel?> listenTo(
      String documentId, WorkflowTaskChanged changed,
      {WorkflowTaskErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<WorkflowTaskModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
