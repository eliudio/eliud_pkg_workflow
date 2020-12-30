/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_workflow/model/workflow_repository.dart';
import 'package:eliud_pkg_workflow/model/workflow_list_event.dart';
import 'package:eliud_pkg_workflow/model/workflow_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class WorkflowListBloc extends Bloc<WorkflowListEvent, WorkflowListState> {
  final WorkflowRepository _workflowRepository;
  StreamSubscription _workflowsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  WorkflowListBloc(this.accessBloc,{ this.eliudQuery, @required WorkflowRepository workflowRepository })
      : assert(workflowRepository != null),
      _workflowRepository = workflowRepository,
      super(WorkflowListLoading());

  Stream<WorkflowListState> _mapLoadWorkflowListToState({ String orderBy, bool descending }) async* {
    _workflowsListSubscription?.cancel();
    _workflowsListSubscription = _workflowRepository.listen((list) => add(WorkflowListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<WorkflowListState> _mapLoadWorkflowListWithDetailsToState() async* {
    _workflowsListSubscription?.cancel();
    _workflowsListSubscription = _workflowRepository.listenWithDetails((list) => add(WorkflowListUpdated(value: list)), );
  }

  Stream<WorkflowListState> _mapAddWorkflowListToState(AddWorkflowList event) async* {
    _workflowRepository.add(event.value);
  }

  Stream<WorkflowListState> _mapUpdateWorkflowListToState(UpdateWorkflowList event) async* {
    _workflowRepository.update(event.value);
  }

  Stream<WorkflowListState> _mapDeleteWorkflowListToState(DeleteWorkflowList event) async* {
    _workflowRepository.delete(event.value);
  }

  Stream<WorkflowListState> _mapWorkflowListUpdatedToState(WorkflowListUpdated event) async* {
    yield WorkflowListLoaded(values: event.value);
  }


  @override
  Stream<WorkflowListState> mapEventToState(WorkflowListEvent event) async* {
    final currentState = state;
    if (event is LoadWorkflowList) {
      yield* _mapLoadWorkflowListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadWorkflowListWithDetails) {
      yield* _mapLoadWorkflowListWithDetailsToState();
    } else if (event is AddWorkflowList) {
      yield* _mapAddWorkflowListToState(event);
    } else if (event is UpdateWorkflowList) {
      yield* _mapUpdateWorkflowListToState(event);
    } else if (event is DeleteWorkflowList) {
      yield* _mapDeleteWorkflowListToState(event);
    } else if (event is WorkflowListUpdated) {
      yield* _mapWorkflowListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _workflowsListSubscription?.cancel();
    return super.close();
  }

}


