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
import 'package:eliud_core/tools/query/query_tools.dart';



class WorkflowListBloc extends Bloc<WorkflowListEvent, WorkflowListState> {
  final WorkflowRepository _workflowRepository;
  StreamSubscription? _workflowsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int workflowLimit;

  WorkflowListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required WorkflowRepository workflowRepository, this.workflowLimit = 5})
      : assert(workflowRepository != null),
        _workflowRepository = workflowRepository,
        super(WorkflowListLoading());

  Stream<WorkflowListState> _mapLoadWorkflowListToState() async* {
    int amountNow =  (state is WorkflowListLoaded) ? (state as WorkflowListLoaded).values!.length : 0;
    _workflowsListSubscription?.cancel();
    _workflowsListSubscription = _workflowRepository.listen(
          (list) => add(WorkflowListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * workflowLimit : null
    );
  }

  Stream<WorkflowListState> _mapLoadWorkflowListWithDetailsToState() async* {
    int amountNow =  (state is WorkflowListLoaded) ? (state as WorkflowListLoaded).values!.length : 0;
    _workflowsListSubscription?.cancel();
    _workflowsListSubscription = _workflowRepository.listenWithDetails(
            (list) => add(WorkflowListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * workflowLimit : null
    );
  }

  Stream<WorkflowListState> _mapAddWorkflowListToState(AddWorkflowList event) async* {
    var value = event.value;
    if (value != null) 
      _workflowRepository.add(value);
  }

  Stream<WorkflowListState> _mapUpdateWorkflowListToState(UpdateWorkflowList event) async* {
    var value = event.value;
    if (value != null) 
      _workflowRepository.update(value);
  }

  Stream<WorkflowListState> _mapDeleteWorkflowListToState(DeleteWorkflowList event) async* {
    var value = event.value;
    if (value != null) 
      _workflowRepository.delete(value);
  }

  Stream<WorkflowListState> _mapWorkflowListUpdatedToState(
      WorkflowListUpdated event) async* {
    yield WorkflowListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<WorkflowListState> mapEventToState(WorkflowListEvent event) async* {
    if (event is LoadWorkflowList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadWorkflowListToState();
      } else {
        yield* _mapLoadWorkflowListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


