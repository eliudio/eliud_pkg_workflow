/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_result_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_workflow/model/assignment_result_repository.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_list_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class AssignmentResultListBloc extends Bloc<AssignmentResultListEvent, AssignmentResultListState> {
  final AssignmentResultRepository _assignmentResultRepository;
  StreamSubscription _assignmentResultsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  AssignmentResultListBloc(this.accessBloc,{ this.eliudQuery, @required AssignmentResultRepository assignmentResultRepository })
      : assert(assignmentResultRepository != null),
      _assignmentResultRepository = assignmentResultRepository,
      super(AssignmentResultListLoading());

  Stream<AssignmentResultListState> _mapLoadAssignmentResultListToState({ String orderBy, bool descending }) async* {
    _assignmentResultsListSubscription?.cancel();
    _assignmentResultsListSubscription = _assignmentResultRepository.listen((list) => add(AssignmentResultListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<AssignmentResultListState> _mapLoadAssignmentResultListWithDetailsToState() async* {
    _assignmentResultsListSubscription?.cancel();
    _assignmentResultsListSubscription = _assignmentResultRepository.listenWithDetails((list) => add(AssignmentResultListUpdated(value: list)), );
  }

  Stream<AssignmentResultListState> _mapAddAssignmentResultListToState(AddAssignmentResultList event) async* {
    _assignmentResultRepository.add(event.value);
  }

  Stream<AssignmentResultListState> _mapUpdateAssignmentResultListToState(UpdateAssignmentResultList event) async* {
    _assignmentResultRepository.update(event.value);
  }

  Stream<AssignmentResultListState> _mapDeleteAssignmentResultListToState(DeleteAssignmentResultList event) async* {
    _assignmentResultRepository.delete(event.value);
  }

  Stream<AssignmentResultListState> _mapAssignmentResultListUpdatedToState(AssignmentResultListUpdated event) async* {
    yield AssignmentResultListLoaded(values: event.value);
  }


  @override
  Stream<AssignmentResultListState> mapEventToState(AssignmentResultListEvent event) async* {
    final currentState = state;
    if (event is LoadAssignmentResultList) {
      yield* _mapLoadAssignmentResultListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadAssignmentResultListWithDetails) {
      yield* _mapLoadAssignmentResultListWithDetailsToState();
    } else if (event is AddAssignmentResultList) {
      yield* _mapAddAssignmentResultListToState(event);
    } else if (event is UpdateAssignmentResultList) {
      yield* _mapUpdateAssignmentResultListToState(event);
    } else if (event is DeleteAssignmentResultList) {
      yield* _mapDeleteAssignmentResultListToState(event);
    } else if (event is AssignmentResultListUpdated) {
      yield* _mapAssignmentResultListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _assignmentResultsListSubscription?.cancel();
    return super.close();
  }

}


