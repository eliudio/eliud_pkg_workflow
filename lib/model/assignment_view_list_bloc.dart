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

import 'package:eliud_pkg_workflow/model/assignment_view_repository.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_list_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'assignment_view_model.dart';

typedef FilterAssignmentViewModels = List<AssignmentViewModel?> Function(
    List<AssignmentViewModel?> values);

class AssignmentViewListBloc
    extends Bloc<AssignmentViewListEvent, AssignmentViewListState> {
  final FilterAssignmentViewModels? filter;
  final AssignmentViewRepository _assignmentViewRepository;
  StreamSubscription? _assignmentViewsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int assignmentViewLimit;

  AssignmentViewListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required AssignmentViewRepository assignmentViewRepository,
      this.assignmentViewLimit = 5})
      : _assignmentViewRepository = assignmentViewRepository,
        super(AssignmentViewListLoading()) {
    on<LoadAssignmentViewList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadAssignmentViewListToState();
      } else {
        _mapLoadAssignmentViewListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadAssignmentViewListWithDetailsToState();
    });

    on<AssignmentViewChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadAssignmentViewListToState();
      } else {
        _mapLoadAssignmentViewListWithDetailsToState();
      }
    });

    on<AddAssignmentViewList>((event, emit) async {
      await _mapAddAssignmentViewListToState(event);
    });

    on<UpdateAssignmentViewList>((event, emit) async {
      await _mapUpdateAssignmentViewListToState(event);
    });

    on<DeleteAssignmentViewList>((event, emit) async {
      await _mapDeleteAssignmentViewListToState(event);
    });

    on<AssignmentViewListUpdated>((event, emit) {
      emit(_mapAssignmentViewListUpdatedToState(event));
    });
  }

  List<AssignmentViewModel?> _filter(List<AssignmentViewModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadAssignmentViewListToState() async {
    int amountNow = (state is AssignmentViewListLoaded)
        ? (state as AssignmentViewListLoaded).values!.length
        : 0;
    _assignmentViewsListSubscription?.cancel();
    _assignmentViewsListSubscription = _assignmentViewRepository.listen(
        (list) => add(AssignmentViewListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit:
            ((paged != null) && paged!) ? pages * assignmentViewLimit : null);
  }

  Future<void> _mapLoadAssignmentViewListWithDetailsToState() async {
    int amountNow = (state is AssignmentViewListLoaded)
        ? (state as AssignmentViewListLoaded).values!.length
        : 0;
    _assignmentViewsListSubscription?.cancel();
    _assignmentViewsListSubscription =
        _assignmentViewRepository.listenWithDetails(
            (list) => add(AssignmentViewListUpdated(
                value: _filter(list), mightHaveMore: amountNow != list.length)),
            orderBy: orderBy,
            descending: descending,
            eliudQuery: eliudQuery,
            limit: ((paged != null) && paged!)
                ? pages * assignmentViewLimit
                : null);
  }

  Future<void> _mapAddAssignmentViewListToState(
      AddAssignmentViewList event) async {
    var value = event.value;
    if (value != null) {
      await _assignmentViewRepository.add(value);
    }
  }

  Future<void> _mapUpdateAssignmentViewListToState(
      UpdateAssignmentViewList event) async {
    var value = event.value;
    if (value != null) {
      await _assignmentViewRepository.update(value);
    }
  }

  Future<void> _mapDeleteAssignmentViewListToState(
      DeleteAssignmentViewList event) async {
    var value = event.value;
    if (value != null) {
      await _assignmentViewRepository.delete(value);
    }
  }

  AssignmentViewListLoaded _mapAssignmentViewListUpdatedToState(
          AssignmentViewListUpdated event) =>
      AssignmentViewListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _assignmentViewsListSubscription?.cancel();
    return super.close();
  }
}
