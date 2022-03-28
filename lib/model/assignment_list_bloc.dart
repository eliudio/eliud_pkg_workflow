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
import 'package:meta/meta.dart';

import 'package:eliud_pkg_workflow/model/assignment_repository.dart';
import 'package:eliud_pkg_workflow/model/assignment_list_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class AssignmentListBloc extends Bloc<AssignmentListEvent, AssignmentListState> {
  final AssignmentRepository _assignmentRepository;
  StreamSubscription? _assignmentsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int assignmentLimit;

  AssignmentListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required AssignmentRepository assignmentRepository, this.assignmentLimit = 5})
      : assert(assignmentRepository != null),
        _assignmentRepository = assignmentRepository,
        super(AssignmentListLoading());

  Stream<AssignmentListState> _mapLoadAssignmentListToState() async* {
    int amountNow =  (state is AssignmentListLoaded) ? (state as AssignmentListLoaded).values!.length : 0;
    _assignmentsListSubscription?.cancel();
    _assignmentsListSubscription = _assignmentRepository.listen(
          (list) => add(AssignmentListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * assignmentLimit : null
    );
  }

  Stream<AssignmentListState> _mapLoadAssignmentListWithDetailsToState() async* {
    int amountNow =  (state is AssignmentListLoaded) ? (state as AssignmentListLoaded).values!.length : 0;
    _assignmentsListSubscription?.cancel();
    _assignmentsListSubscription = _assignmentRepository.listenWithDetails(
            (list) => add(AssignmentListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * assignmentLimit : null
    );
  }

  Stream<AssignmentListState> _mapAddAssignmentListToState(AddAssignmentList event) async* {
    var value = event.value;
    if (value != null) 
      _assignmentRepository.add(value);
  }

  Stream<AssignmentListState> _mapUpdateAssignmentListToState(UpdateAssignmentList event) async* {
    var value = event.value;
    if (value != null) 
      _assignmentRepository.update(value);
  }

  Stream<AssignmentListState> _mapDeleteAssignmentListToState(DeleteAssignmentList event) async* {
    var value = event.value;
    if (value != null) 
      _assignmentRepository.delete(value);
  }

  Stream<AssignmentListState> _mapAssignmentListUpdatedToState(
      AssignmentListUpdated event) async* {
    yield AssignmentListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<AssignmentListState> mapEventToState(AssignmentListEvent event) async* {
    if (event is LoadAssignmentList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadAssignmentListToState();
      } else {
        yield* _mapLoadAssignmentListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadAssignmentListWithDetailsToState();
    } else if (event is AssignmentChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadAssignmentListToState();
      } else {
        yield* _mapLoadAssignmentListWithDetailsToState();
      }
    } else if (event is AddAssignmentList) {
      yield* _mapAddAssignmentListToState(event);
    } else if (event is UpdateAssignmentList) {
      yield* _mapUpdateAssignmentListToState(event);
    } else if (event is DeleteAssignmentList) {
      yield* _mapDeleteAssignmentListToState(event);
    } else if (event is AssignmentListUpdated) {
      yield* _mapAssignmentListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _assignmentsListSubscription?.cancel();
    return super.close();
  }
}


