/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/embedded_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/model/app_model.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/assignment_list_bloc.dart';
import '../model/assignment_list.dart';
import '../model/assignment_list_event.dart';
import '../model/assignment_model.dart';
import '../model/assignment_entity.dart';
import '../model/assignment_repository.dart';

import '../model/assignment_result_list_bloc.dart';
import '../model/assignment_result_list.dart';
import '../model/assignment_result_list_event.dart';
import '../model/assignment_result_model.dart';
import '../model/assignment_result_entity.dart';
import '../model/assignment_result_repository.dart';

import '../model/workflow_task_list_bloc.dart';
import '../model/workflow_task_list.dart';
import '../model/workflow_task_list_event.dart';
import '../model/workflow_task_model.dart';
import '../model/workflow_task_entity.dart';
import '../model/workflow_task_repository.dart';

typedef AssignmentListChanged = Function(List<AssignmentModel> values);
typedef AssignmentResultListChanged = Function(
    List<AssignmentResultModel> values);
typedef WorkflowTaskListChanged = Function(List<WorkflowTaskModel> values);

assignmentsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.assignmentsList(app, context, value, trigger);
assignmentResultsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.assignmentResultsList(
        app, context, value, trigger);
workflowTasksList(app, context, value, trigger) =>
    EmbeddedComponentFactory.workflowTasksList(app, context, value, trigger);

class EmbeddedComponentFactory {
  static Widget assignmentsList(AppModel app, BuildContext context,
      List<AssignmentModel> values, AssignmentListChanged trigger) {
    AssignmentInMemoryRepository inMemoryRepository =
        AssignmentInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<AssignmentListBloc>(
          create: (context) => AssignmentListBloc(
            assignmentRepository: inMemoryRepository,
          )..add(LoadAssignmentList()),
        )
      ],
      child: AssignmentListWidget(app: app, isEmbedded: true),
    );
  }

  static Widget assignmentResultsList(AppModel app, BuildContext context,
      List<AssignmentResultModel> values, AssignmentResultListChanged trigger) {
    AssignmentResultInMemoryRepository inMemoryRepository =
        AssignmentResultInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<AssignmentResultListBloc>(
          create: (context) => AssignmentResultListBloc(
            assignmentResultRepository: inMemoryRepository,
          )..add(LoadAssignmentResultList()),
        )
      ],
      child: AssignmentResultListWidget(app: app, isEmbedded: true),
    );
  }

  static Widget workflowTasksList(AppModel app, BuildContext context,
      List<WorkflowTaskModel> values, WorkflowTaskListChanged trigger) {
    WorkflowTaskInMemoryRepository inMemoryRepository =
        WorkflowTaskInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<WorkflowTaskListBloc>(
          create: (context) => WorkflowTaskListBloc(
            workflowTaskRepository: inMemoryRepository,
          )..add(LoadWorkflowTaskList()),
        )
      ],
      child: WorkflowTaskListWidget(app: app, isEmbedded: true),
    );
  }
}

class AssignmentInMemoryRepository implements AssignmentRepository {
  final List<AssignmentModel> items;
  final AssignmentListChanged trigger;
  Stream<List<AssignmentModel>>? theValues;

  AssignmentInMemoryRepository(this.trigger, this.items) {
    List<List<AssignmentModel>> myList = <List<AssignmentModel>>[];
    myList.add(items);
    theValues = Stream<List<AssignmentModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  @override
  Future<AssignmentEntity> addEntity(
      String documentID, AssignmentEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<AssignmentEntity> updateEntity(
      String documentID, AssignmentEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<AssignmentModel> add(AssignmentModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  @override
  Future<void> delete(AssignmentModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  @override
  Future<AssignmentModel> update(AssignmentModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  @override
  Future<AssignmentModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<AssignmentModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  @override
  Stream<List<AssignmentModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  Stream<List<AssignmentModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  StreamSubscription<List<AssignmentModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  StreamSubscription<List<AssignmentModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  void flush() {}

  @override
  Future<List<AssignmentModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<AssignmentModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  @override
  StreamSubscription<AssignmentModel> listenTo(
      String documentId, AssignmentChanged changed,
      {AssignmentErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<AssignmentModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<AssignmentEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  AssignmentEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

class AssignmentResultInMemoryRepository implements AssignmentResultRepository {
  final List<AssignmentResultModel> items;
  final AssignmentResultListChanged trigger;
  Stream<List<AssignmentResultModel>>? theValues;

  AssignmentResultInMemoryRepository(this.trigger, this.items) {
    List<List<AssignmentResultModel>> myList = <List<AssignmentResultModel>>[];
    myList.add(items);
    theValues = Stream<List<AssignmentResultModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  @override
  Future<AssignmentResultEntity> addEntity(
      String documentID, AssignmentResultEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<AssignmentResultEntity> updateEntity(
      String documentID, AssignmentResultEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<AssignmentResultModel> add(AssignmentResultModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  @override
  Future<void> delete(AssignmentResultModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  @override
  Future<AssignmentResultModel> update(AssignmentResultModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  @override
  Future<AssignmentResultModel> get(String? id,
      {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<AssignmentResultModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  @override
  Stream<List<AssignmentResultModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  Stream<List<AssignmentResultModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  StreamSubscription<List<AssignmentResultModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  StreamSubscription<List<AssignmentResultModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  void flush() {}

  @override
  Future<List<AssignmentResultModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<AssignmentResultModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  @override
  StreamSubscription<AssignmentResultModel> listenTo(
      String documentId, AssignmentResultChanged changed,
      {AssignmentResultErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<AssignmentResultModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<AssignmentResultEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  AssignmentResultEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

class WorkflowTaskInMemoryRepository implements WorkflowTaskRepository {
  final List<WorkflowTaskModel> items;
  final WorkflowTaskListChanged trigger;
  Stream<List<WorkflowTaskModel>>? theValues;

  WorkflowTaskInMemoryRepository(this.trigger, this.items) {
    List<List<WorkflowTaskModel>> myList = <List<WorkflowTaskModel>>[];
    myList.add(items);
    theValues = Stream<List<WorkflowTaskModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  @override
  Future<WorkflowTaskEntity> addEntity(
      String documentID, WorkflowTaskEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<WorkflowTaskEntity> updateEntity(
      String documentID, WorkflowTaskEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<WorkflowTaskModel> add(WorkflowTaskModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  @override
  Future<void> delete(WorkflowTaskModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  @override
  Future<WorkflowTaskModel> update(WorkflowTaskModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  @override
  Future<WorkflowTaskModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<WorkflowTaskModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  @override
  Stream<List<WorkflowTaskModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  Stream<List<WorkflowTaskModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  StreamSubscription<List<WorkflowTaskModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  StreamSubscription<List<WorkflowTaskModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  void flush() {}

  @override
  Future<List<WorkflowTaskModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<WorkflowTaskModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  @override
  StreamSubscription<WorkflowTaskModel> listenTo(
      String documentId, WorkflowTaskChanged changed,
      {WorkflowTaskErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<WorkflowTaskModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<WorkflowTaskEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  WorkflowTaskEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}
