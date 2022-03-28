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
import 'package:eliud_core/tools/query/query_tools.dart';



class AssignmentViewListBloc extends Bloc<AssignmentViewListEvent, AssignmentViewListState> {
  final AssignmentViewRepository _assignmentViewRepository;
  StreamSubscription? _assignmentViewsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int assignmentViewLimit;

  AssignmentViewListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required AssignmentViewRepository assignmentViewRepository, this.assignmentViewLimit = 5})
      : assert(assignmentViewRepository != null),
        _assignmentViewRepository = assignmentViewRepository,
        super(AssignmentViewListLoading());

  Stream<AssignmentViewListState> _mapLoadAssignmentViewListToState() async* {
    int amountNow =  (state is AssignmentViewListLoaded) ? (state as AssignmentViewListLoaded).values!.length : 0;
    _assignmentViewsListSubscription?.cancel();
    _assignmentViewsListSubscription = _assignmentViewRepository.listen(
          (list) => add(AssignmentViewListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * assignmentViewLimit : null
    );
  }

  Stream<AssignmentViewListState> _mapLoadAssignmentViewListWithDetailsToState() async* {
    int amountNow =  (state is AssignmentViewListLoaded) ? (state as AssignmentViewListLoaded).values!.length : 0;
    _assignmentViewsListSubscription?.cancel();
    _assignmentViewsListSubscription = _assignmentViewRepository.listenWithDetails(
            (list) => add(AssignmentViewListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * assignmentViewLimit : null
    );
  }

  Stream<AssignmentViewListState> _mapAddAssignmentViewListToState(AddAssignmentViewList event) async* {
    var value = event.value;
    if (value != null) 
      _assignmentViewRepository.add(value);
  }

  Stream<AssignmentViewListState> _mapUpdateAssignmentViewListToState(UpdateAssignmentViewList event) async* {
    var value = event.value;
    if (value != null) 
      _assignmentViewRepository.update(value);
  }

  Stream<AssignmentViewListState> _mapDeleteAssignmentViewListToState(DeleteAssignmentViewList event) async* {
    var value = event.value;
    if (value != null) 
      _assignmentViewRepository.delete(value);
  }

  Stream<AssignmentViewListState> _mapAssignmentViewListUpdatedToState(
      AssignmentViewListUpdated event) async* {
    yield AssignmentViewListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<AssignmentViewListState> mapEventToState(AssignmentViewListEvent event) async* {
    if (event is LoadAssignmentViewList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadAssignmentViewListToState();
      } else {
        yield* _mapLoadAssignmentViewListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadAssignmentViewListWithDetailsToState();
    } else if (event is AssignmentViewChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadAssignmentViewListToState();
      } else {
        yield* _mapLoadAssignmentViewListWithDetailsToState();
      }
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


