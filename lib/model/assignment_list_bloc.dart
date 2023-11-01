/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_workflow/model/assignment_repository.dart';
import 'package:eliud_pkg_workflow/model/assignment_list_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'assignment_model.dart';

typedef List<AssignmentModel?> FilterAssignmentModels(List<AssignmentModel?> values);



class AssignmentListBloc extends Bloc<AssignmentListEvent, AssignmentListState> {
  final FilterAssignmentModels? filter;
  final AssignmentRepository _assignmentRepository;
  StreamSubscription? _assignmentsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int assignmentLimit;

  AssignmentListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required AssignmentRepository assignmentRepository, this.assignmentLimit = 5})
      : _assignmentRepository = assignmentRepository,
        super(AssignmentListLoading()) {
    on <LoadAssignmentList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadAssignmentListToState();
      } else {
        _mapLoadAssignmentListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadAssignmentListWithDetailsToState();
    });
    
    on <AssignmentChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadAssignmentListToState();
      } else {
        _mapLoadAssignmentListWithDetailsToState();
      }
    });
      
    on <AddAssignmentList> ((event, emit) async {
      await _mapAddAssignmentListToState(event);
    });
    
    on <UpdateAssignmentList> ((event, emit) async {
      await _mapUpdateAssignmentListToState(event);
    });
    
    on <DeleteAssignmentList> ((event, emit) async {
      await _mapDeleteAssignmentListToState(event);
    });
    
    on <AssignmentListUpdated> ((event, emit) {
      emit(_mapAssignmentListUpdatedToState(event));
    });
  }

  List<AssignmentModel?> _filter(List<AssignmentModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadAssignmentListToState() async {
    int amountNow =  (state is AssignmentListLoaded) ? (state as AssignmentListLoaded).values!.length : 0;
    _assignmentsListSubscription?.cancel();
    _assignmentsListSubscription = _assignmentRepository.listen(
          (list) => add(AssignmentListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * assignmentLimit : null
    );
  }

  Future<void> _mapLoadAssignmentListWithDetailsToState() async {
    int amountNow =  (state is AssignmentListLoaded) ? (state as AssignmentListLoaded).values!.length : 0;
    _assignmentsListSubscription?.cancel();
    _assignmentsListSubscription = _assignmentRepository.listenWithDetails(
            (list) => add(AssignmentListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * assignmentLimit : null
    );
  }

  Future<void> _mapAddAssignmentListToState(AddAssignmentList event) async {
    var value = event.value;
    if (value != null) {
      await _assignmentRepository.add(value);
    }
  }

  Future<void> _mapUpdateAssignmentListToState(UpdateAssignmentList event) async {
    var value = event.value;
    if (value != null) {
      await _assignmentRepository.update(value);
    }
  }

  Future<void> _mapDeleteAssignmentListToState(DeleteAssignmentList event) async {
    var value = event.value;
    if (value != null) {
      await _assignmentRepository.delete(value);
    }
  }

  AssignmentListLoaded _mapAssignmentListUpdatedToState(
      AssignmentListUpdated event) => AssignmentListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _assignmentsListSubscription?.cancel();
    return super.close();
  }
}


