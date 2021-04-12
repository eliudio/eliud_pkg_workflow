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
import 'package:eliud_core/tools/query/query_tools.dart';


const _workflowTaskLimit = 5;

class WorkflowTaskListBloc extends Bloc<WorkflowTaskListEvent, WorkflowTaskListState> {
  final WorkflowTaskRepository _workflowTaskRepository;
  StreamSubscription? _workflowTasksListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  WorkflowTaskListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required WorkflowTaskRepository workflowTaskRepository})
      : assert(workflowTaskRepository != null),
        _workflowTaskRepository = workflowTaskRepository,
        super(WorkflowTaskListLoading());

  Stream<WorkflowTaskListState> _mapLoadWorkflowTaskListToState() async* {
    int amountNow =  (state is WorkflowTaskListLoaded) ? (state as WorkflowTaskListLoaded).values!.length : 0;
    _workflowTasksListSubscription?.cancel();
    _workflowTasksListSubscription = _workflowTaskRepository.listen(
          (list) => add(WorkflowTaskListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _workflowTaskLimit : null
    );
  }

  Stream<WorkflowTaskListState> _mapLoadWorkflowTaskListWithDetailsToState() async* {
    int amountNow =  (state is WorkflowTaskListLoaded) ? (state as WorkflowTaskListLoaded).values!.length : 0;
    _workflowTasksListSubscription?.cancel();
    _workflowTasksListSubscription = _workflowTaskRepository.listenWithDetails(
            (list) => add(WorkflowTaskListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _workflowTaskLimit : null
    );
  }

  Stream<WorkflowTaskListState> _mapAddWorkflowTaskListToState(AddWorkflowTaskList event) async* {
    var value = event.value;
    if (value != null) 
      _workflowTaskRepository.add(value);
  }

  Stream<WorkflowTaskListState> _mapUpdateWorkflowTaskListToState(UpdateWorkflowTaskList event) async* {
    var value = event.value;
    if (value != null) 
      _workflowTaskRepository.update(value);
  }

  Stream<WorkflowTaskListState> _mapDeleteWorkflowTaskListToState(DeleteWorkflowTaskList event) async* {
    var value = event.value;
    if (value != null) 
      _workflowTaskRepository.delete(value);
  }

  Stream<WorkflowTaskListState> _mapWorkflowTaskListUpdatedToState(
      WorkflowTaskListUpdated event) async* {
    yield WorkflowTaskListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<WorkflowTaskListState> mapEventToState(WorkflowTaskListEvent event) async* {
    if (event is LoadWorkflowTaskList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadWorkflowTaskListToState();
      } else {
        yield* _mapLoadWorkflowTaskListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


