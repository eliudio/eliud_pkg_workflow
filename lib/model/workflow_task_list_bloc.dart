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



class WorkflowTaskListBloc extends Bloc<WorkflowTaskListEvent, WorkflowTaskListState> {
  final WorkflowTaskRepository _workflowTaskRepository;
  StreamSubscription? _workflowTasksListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int workflowTaskLimit;

  WorkflowTaskListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required WorkflowTaskRepository workflowTaskRepository, this.workflowTaskLimit = 5})
      : assert(workflowTaskRepository != null),
        _workflowTaskRepository = workflowTaskRepository,
        super(WorkflowTaskListLoading()) {
    on <LoadWorkflowTaskList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadWorkflowTaskListToState();
      } else {
        _mapLoadWorkflowTaskListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadWorkflowTaskListWithDetailsToState();
    });
    
    on <WorkflowTaskChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadWorkflowTaskListToState();
      } else {
        _mapLoadWorkflowTaskListWithDetailsToState();
      }
    });
      
    on <AddWorkflowTaskList> ((event, emit) async {
      await _mapAddWorkflowTaskListToState(event);
    });
    
    on <UpdateWorkflowTaskList> ((event, emit) async {
      await _mapUpdateWorkflowTaskListToState(event);
    });
    
    on <DeleteWorkflowTaskList> ((event, emit) async {
      await _mapDeleteWorkflowTaskListToState(event);
    });
    
    on <WorkflowTaskListUpdated> ((event, emit) {
      emit(_mapWorkflowTaskListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadWorkflowTaskListToState() async {
    int amountNow =  (state is WorkflowTaskListLoaded) ? (state as WorkflowTaskListLoaded).values!.length : 0;
    _workflowTasksListSubscription?.cancel();
    _workflowTasksListSubscription = _workflowTaskRepository.listen(
          (list) => add(WorkflowTaskListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * workflowTaskLimit : null
    );
  }

  Future<void> _mapLoadWorkflowTaskListWithDetailsToState() async {
    int amountNow =  (state is WorkflowTaskListLoaded) ? (state as WorkflowTaskListLoaded).values!.length : 0;
    _workflowTasksListSubscription?.cancel();
    _workflowTasksListSubscription = _workflowTaskRepository.listenWithDetails(
            (list) => add(WorkflowTaskListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * workflowTaskLimit : null
    );
  }

  Future<void> _mapAddWorkflowTaskListToState(AddWorkflowTaskList event) async {
    var value = event.value;
    if (value != null) {
      await _workflowTaskRepository.add(value);
    }
  }

  Future<void> _mapUpdateWorkflowTaskListToState(UpdateWorkflowTaskList event) async {
    var value = event.value;
    if (value != null) {
      await _workflowTaskRepository.update(value);
    }
  }

  Future<void> _mapDeleteWorkflowTaskListToState(DeleteWorkflowTaskList event) async {
    var value = event.value;
    if (value != null) {
      await _workflowTaskRepository.delete(value);
    }
  }

  WorkflowTaskListLoaded _mapWorkflowTaskListUpdatedToState(
      WorkflowTaskListUpdated event) => WorkflowTaskListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _workflowTasksListSubscription?.cancel();
    return super.close();
  }
}


