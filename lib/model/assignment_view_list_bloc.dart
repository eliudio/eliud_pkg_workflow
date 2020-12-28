/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_workflow/model/assignment_view_repository.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_list_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class AssignmentViewListBloc extends Bloc<AssignmentViewListEvent, AssignmentViewListState> {
  final AssignmentViewRepository _assignmentViewRepository;
  StreamSubscription _assignmentViewsListSubscription;
  final AccessBloc accessBloc;

  AssignmentViewListBloc(this.accessBloc,{ @required AssignmentViewRepository assignmentViewRepository })
      : assert(assignmentViewRepository != null),
      _assignmentViewRepository = assignmentViewRepository,
      super(AssignmentViewListLoading());

  Stream<AssignmentViewListState> _mapLoadAssignmentViewListToState({ String orderBy, bool descending }) async* {
    _assignmentViewsListSubscription?.cancel();
    _assignmentViewsListSubscription = _assignmentViewRepository.listen((list) => add(AssignmentViewListUpdated(value: list)), orderBy: orderBy, descending: descending, );
  }

  Stream<AssignmentViewListState> _mapLoadAssignmentViewListWithDetailsToState() async* {
    _assignmentViewsListSubscription?.cancel();
    _assignmentViewsListSubscription = _assignmentViewRepository.listenWithDetails((list) => add(AssignmentViewListUpdated(value: list)), );
  }

  Stream<AssignmentViewListState> _mapAddAssignmentViewListToState(AddAssignmentViewList event) async* {
    _assignmentViewRepository.add(event.value);
  }

  Stream<AssignmentViewListState> _mapUpdateAssignmentViewListToState(UpdateAssignmentViewList event) async* {
    _assignmentViewRepository.update(event.value);
  }

  Stream<AssignmentViewListState> _mapDeleteAssignmentViewListToState(DeleteAssignmentViewList event) async* {
    _assignmentViewRepository.delete(event.value);
  }

  Stream<AssignmentViewListState> _mapAssignmentViewListUpdatedToState(AssignmentViewListUpdated event) async* {
    yield AssignmentViewListLoaded(values: event.value);
  }


  @override
  Stream<AssignmentViewListState> mapEventToState(AssignmentViewListEvent event) async* {
    final currentState = state;
    if (event is LoadAssignmentViewList) {
      yield* _mapLoadAssignmentViewListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadAssignmentViewListWithDetails) {
      yield* _mapLoadAssignmentViewListWithDetailsToState();
    } else if (event is AddAssignmentViewList) {
      yield* _mapAddAssignmentViewListToState(event);
    } else if (event is UpdateAssignmentViewList) {
      yield* _mapUpdateAssignmentViewListToState(event);
    } else if (event is DeleteAssignmentViewList) {
      yield* _mapDeleteAssignmentViewListToState(event);
    } else if (event is AssignmentViewListUpdated) {
      yield* _mapAssignmentViewListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _assignmentViewsListSubscription?.cancel();
    return super.close();
  }

}


