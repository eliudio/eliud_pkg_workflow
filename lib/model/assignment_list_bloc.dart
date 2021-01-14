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
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class AssignmentListBloc extends Bloc<AssignmentListEvent, AssignmentListState> {
  final AssignmentRepository _assignmentRepository;
  StreamSubscription _assignmentsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  AssignmentListBloc(this.accessBloc,{ this.eliudQuery, @required AssignmentRepository assignmentRepository })
      : assert(assignmentRepository != null),
      _assignmentRepository = assignmentRepository,
      super(AssignmentListLoading());

  Stream<AssignmentListState> _mapLoadAssignmentListToState({ String orderBy, bool descending }) async* {
    _assignmentsListSubscription?.cancel();
    _assignmentsListSubscription = _assignmentRepository.listen((list) => add(AssignmentListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<AssignmentListState> _mapLoadAssignmentListWithDetailsToState({ String orderBy, bool descending }) async* {
    _assignmentsListSubscription?.cancel();
    _assignmentsListSubscription = _assignmentRepository.listenWithDetails((list) => add(AssignmentListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<AssignmentListState> _mapAddAssignmentListToState(AddAssignmentList event) async* {
    _assignmentRepository.add(event.value);
  }

  Stream<AssignmentListState> _mapUpdateAssignmentListToState(UpdateAssignmentList event) async* {
    _assignmentRepository.update(event.value);
  }

  Stream<AssignmentListState> _mapDeleteAssignmentListToState(DeleteAssignmentList event) async* {
    _assignmentRepository.delete(event.value);
  }

  Stream<AssignmentListState> _mapAssignmentListUpdatedToState(AssignmentListUpdated event) async* {
    yield AssignmentListLoaded(values: event.value);
  }


  @override
  Stream<AssignmentListState> mapEventToState(AssignmentListEvent event) async* {
    final currentState = state;
    if (event is LoadAssignmentList) {
      yield* _mapLoadAssignmentListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadAssignmentListWithDetails) {
      yield* _mapLoadAssignmentListWithDetailsToState();
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


