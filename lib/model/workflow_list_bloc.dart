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

import 'package:eliud_pkg_workflow/model/workflow_repository.dart';
import 'package:eliud_pkg_workflow/model/workflow_list_event.dart';
import 'package:eliud_pkg_workflow/model/workflow_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'workflow_model.dart';

typedef FilterWorkflowModels = List<WorkflowModel?> Function(
    List<WorkflowModel?> values);

class WorkflowListBloc extends Bloc<WorkflowListEvent, WorkflowListState> {
  final FilterWorkflowModels? filter;
  final WorkflowRepository _workflowRepository;
  StreamSubscription? _workflowsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int workflowLimit;

  WorkflowListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required WorkflowRepository workflowRepository,
      this.workflowLimit = 5})
      : _workflowRepository = workflowRepository,
        super(WorkflowListLoading()) {
    on<LoadWorkflowList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadWorkflowListToState();
      } else {
        _mapLoadWorkflowListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadWorkflowListWithDetailsToState();
    });

    on<WorkflowChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadWorkflowListToState();
      } else {
        _mapLoadWorkflowListWithDetailsToState();
      }
    });

    on<AddWorkflowList>((event, emit) async {
      await _mapAddWorkflowListToState(event);
    });

    on<UpdateWorkflowList>((event, emit) async {
      await _mapUpdateWorkflowListToState(event);
    });

    on<DeleteWorkflowList>((event, emit) async {
      await _mapDeleteWorkflowListToState(event);
    });

    on<WorkflowListUpdated>((event, emit) {
      emit(_mapWorkflowListUpdatedToState(event));
    });
  }

  List<WorkflowModel?> _filter(List<WorkflowModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadWorkflowListToState() async {
    int amountNow = (state is WorkflowListLoaded)
        ? (state as WorkflowListLoaded).values!.length
        : 0;
    _workflowsListSubscription?.cancel();
    _workflowsListSubscription = _workflowRepository.listen(
        (list) => add(WorkflowListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * workflowLimit : null);
  }

  Future<void> _mapLoadWorkflowListWithDetailsToState() async {
    int amountNow = (state is WorkflowListLoaded)
        ? (state as WorkflowListLoaded).values!.length
        : 0;
    _workflowsListSubscription?.cancel();
    _workflowsListSubscription = _workflowRepository.listenWithDetails(
        (list) => add(WorkflowListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * workflowLimit : null);
  }

  Future<void> _mapAddWorkflowListToState(AddWorkflowList event) async {
    var value = event.value;
    if (value != null) {
      await _workflowRepository.add(value);
    }
  }

  Future<void> _mapUpdateWorkflowListToState(UpdateWorkflowList event) async {
    var value = event.value;
    if (value != null) {
      await _workflowRepository.update(value);
    }
  }

  Future<void> _mapDeleteWorkflowListToState(DeleteWorkflowList event) async {
    var value = event.value;
    if (value != null) {
      await _workflowRepository.delete(value);
    }
  }

  WorkflowListLoaded _mapWorkflowListUpdatedToState(
          WorkflowListUpdated event) =>
      WorkflowListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _workflowsListSubscription?.cancel();
    return super.close();
  }
}
