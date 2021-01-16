/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_task_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_workflow/model/workflow_task_repository.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_list_event.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class WorkflowTaskListBloc extends Bloc<WorkflowTaskListEvent, WorkflowTaskListState> {
  final WorkflowTaskRepository _workflowTaskRepository;
  StreamSubscription _workflowTasksListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  WorkflowTaskListBloc(this.accessBloc,{ this.eliudQuery, @required WorkflowTaskRepository workflowTaskRepository })
      : assert(workflowTaskRepository != null),
      _workflowTaskRepository = workflowTaskRepository,
      super(WorkflowTaskListLoading());

  Stream<WorkflowTaskListState> _mapLoadWorkflowTaskListToState({ String orderBy, bool descending }) async* {
    _workflowTasksListSubscription?.cancel();
    _workflowTasksListSubscription = _workflowTaskRepository.listen((list) => add(WorkflowTaskListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<WorkflowTaskListState> _mapLoadWorkflowTaskListWithDetailsToState({ String orderBy, bool descending }) async* {
    _workflowTasksListSubscription?.cancel();
    _workflowTasksListSubscription = _workflowTaskRepository.listenWithDetails((list) => add(WorkflowTaskListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<WorkflowTaskListState> _mapAddWorkflowTaskListToState(AddWorkflowTaskList event) async* {
    _workflowTaskRepository.add(event.value);
  }

  Stream<WorkflowTaskListState> _mapUpdateWorkflowTaskListToState(UpdateWorkflowTaskList event) async* {
    _workflowTaskRepository.update(event.value);
  }

  Stream<WorkflowTaskListState> _mapDeleteWorkflowTaskListToState(DeleteWorkflowTaskList event) async* {
    _workflowTaskRepository.delete(event.value);
  }

  Stream<WorkflowTaskListState> _mapWorkflowTaskListUpdatedToState(WorkflowTaskListUpdated event) async* {
    yield WorkflowTaskListLoaded(values: event.value);
  }


  @override
  Stream<WorkflowTaskListState> mapEventToState(WorkflowTaskListEvent event) async* {
    final currentState = state;
    if (event is LoadWorkflowTaskList) {
      yield* _mapLoadWorkflowTaskListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadWorkflowTaskListWithDetails) {
      yield* _mapLoadWorkflowTaskListWithDetailsToState();
    } else if (event is AddWorkflowTaskList) {
      yield* _mapAddWorkflowTaskListToState(event);
    } else if (event is UpdateWorkflowTaskList) {
      yield* _mapUpdateWorkflowTaskListToState(event);
    } else if (event is DeleteWorkflowTaskList) {
      yield* _mapDeleteWorkflowTaskListToState(event);
    } else if (event is WorkflowTaskListUpdated) {
      yield* _mapWorkflowTaskListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _workflowTasksListSubscription?.cancel();
    return super.close();
  }

}


