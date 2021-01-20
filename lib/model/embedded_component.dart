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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';

import '../model/assignment_list_bloc.dart';
import '../model/assignment_list.dart';
import '../model/assignment_list_event.dart';
import '../model/assignment_model.dart';
import '../model/assignment_repository.dart';

import '../model/assignment_result_list_bloc.dart';
import '../model/assignment_result_list.dart';
import '../model/assignment_result_list_event.dart';
import '../model/assignment_result_model.dart';
import '../model/assignment_result_repository.dart';

import '../model/workflow_task_list_bloc.dart';
import '../model/workflow_task_list.dart';
import '../model/workflow_task_list_event.dart';
import '../model/workflow_task_model.dart';
import '../model/workflow_task_repository.dart';

typedef AssignmentListChanged(List<AssignmentModel> values);
typedef AssignmentResultListChanged(List<AssignmentResultModel> values);
typedef WorkflowTaskListChanged(List<WorkflowTaskModel> values);

assignmentsList(context, value, trigger) => EmbeddedComponentFactory.assignmentsList(context, value, trigger);
assignmentResultsList(context, value, trigger) => EmbeddedComponentFactory.assignmentResultsList(context, value, trigger);
workflowTasksList(context, value, trigger) => EmbeddedComponentFactory.workflowTasksList(context, value, trigger);

class EmbeddedComponentFactory {

static Widget assignmentsList(BuildContext context, List<AssignmentModel> values, AssignmentListChanged trigger) {
  AssignmentInMemoryRepository inMemoryRepository = AssignmentInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<AssignmentListBloc>(
        create: (context) => AssignmentListBloc(
          assignmentRepository: inMemoryRepository,
          )..add(LoadAssignmentList()),
        )
        ],
    child: AssignmentListWidget(isEmbedded: true),
  );
}

static Widget assignmentResultsList(BuildContext context, List<AssignmentResultModel> values, AssignmentResultListChanged trigger) {
  AssignmentResultInMemoryRepository inMemoryRepository = AssignmentResultInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<AssignmentResultListBloc>(
        create: (context) => AssignmentResultListBloc(
          assignmentResultRepository: inMemoryRepository,
          )..add(LoadAssignmentResultList()),
        )
        ],
    child: AssignmentResultListWidget(isEmbedded: true),
  );
}

static Widget workflowTasksList(BuildContext context, List<WorkflowTaskModel> values, WorkflowTaskListChanged trigger) {
  WorkflowTaskInMemoryRepository inMemoryRepository = WorkflowTaskInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<WorkflowTaskListBloc>(
        create: (context) => WorkflowTaskListBloc(
          workflowTaskRepository: inMemoryRepository,
          )..add(LoadWorkflowTaskList()),
        )
        ],
    child: WorkflowTaskListWidget(isEmbedded: true),
  );
}


}

class AssignmentInMemoryRepository implements AssignmentRepository {
    final List<AssignmentModel> items;
    final AssignmentListChanged trigger;
    Stream<List<AssignmentModel>> theValues;

    AssignmentInMemoryRepository({this.trigger, this.items}) {
        List<List<AssignmentModel>> myList = new List<List<AssignmentModel>>();
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

    Future<AssignmentModel> add(AssignmentModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
    }

    Future<void> delete(AssignmentModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
    }

    Future<AssignmentModel> update(AssignmentModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
    }

    Future<AssignmentModel> get(String id, { Function(Exception) onError }) {
      int index = _index(id);
      var completer = new Completer<AssignmentModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<AssignmentModel>> values({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues;
    }
    
    Stream<List<AssignmentModel>> valuesWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<AssignmentModel>> listen(trigger, { String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<AssignmentModel>> listenWithDetails(trigger, { String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<AssignmentModel>> valuesList({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return Future.value(items);
    }
    
    Future<List<AssignmentModel>> valuesListWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
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
  StreamSubscription<AssignmentModel> listenTo(String documentId, AssignmentChanged changed) {
    throw UnimplementedError();
  }
  

    Future<void> deleteAll() {}
}

class AssignmentResultInMemoryRepository implements AssignmentResultRepository {
    final List<AssignmentResultModel> items;
    final AssignmentResultListChanged trigger;
    Stream<List<AssignmentResultModel>> theValues;

    AssignmentResultInMemoryRepository({this.trigger, this.items}) {
        List<List<AssignmentResultModel>> myList = new List<List<AssignmentResultModel>>();
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

    Future<AssignmentResultModel> add(AssignmentResultModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
    }

    Future<void> delete(AssignmentResultModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
    }

    Future<AssignmentResultModel> update(AssignmentResultModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
    }

    Future<AssignmentResultModel> get(String id, { Function(Exception) onError }) {
      int index = _index(id);
      var completer = new Completer<AssignmentResultModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<AssignmentResultModel>> values({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues;
    }
    
    Stream<List<AssignmentResultModel>> valuesWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<AssignmentResultModel>> listen(trigger, { String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<AssignmentResultModel>> listenWithDetails(trigger, { String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<AssignmentResultModel>> valuesList({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return Future.value(items);
    }
    
    Future<List<AssignmentResultModel>> valuesListWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
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
  StreamSubscription<AssignmentResultModel> listenTo(String documentId, AssignmentResultChanged changed) {
    throw UnimplementedError();
  }
  

    Future<void> deleteAll() {}
}

class WorkflowTaskInMemoryRepository implements WorkflowTaskRepository {
    final List<WorkflowTaskModel> items;
    final WorkflowTaskListChanged trigger;
    Stream<List<WorkflowTaskModel>> theValues;

    WorkflowTaskInMemoryRepository({this.trigger, this.items}) {
        List<List<WorkflowTaskModel>> myList = new List<List<WorkflowTaskModel>>();
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

    Future<WorkflowTaskModel> add(WorkflowTaskModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
    }

    Future<void> delete(WorkflowTaskModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
    }

    Future<WorkflowTaskModel> update(WorkflowTaskModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
    }

    Future<WorkflowTaskModel> get(String id, { Function(Exception) onError }) {
      int index = _index(id);
      var completer = new Completer<WorkflowTaskModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<WorkflowTaskModel>> values({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues;
    }
    
    Stream<List<WorkflowTaskModel>> valuesWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<WorkflowTaskModel>> listen(trigger, { String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<WorkflowTaskModel>> listenWithDetails(trigger, { String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<WorkflowTaskModel>> valuesList({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return Future.value(items);
    }
    
    Future<List<WorkflowTaskModel>> valuesListWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
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
  StreamSubscription<WorkflowTaskModel> listenTo(String documentId, WorkflowTaskChanged changed) {
    throw UnimplementedError();
  }
  

    Future<void> deleteAll() {}
}

