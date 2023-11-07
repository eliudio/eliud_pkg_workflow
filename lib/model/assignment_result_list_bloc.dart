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

import 'package:eliud_pkg_workflow/model/assignment_result_repository.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_list_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'assignment_result_model.dart';

typedef FilterAssignmentResultModels = List<AssignmentResultModel?> Function(
    List<AssignmentResultModel?> values);

class AssignmentResultListBloc
    extends Bloc<AssignmentResultListEvent, AssignmentResultListState> {
  final FilterAssignmentResultModels? filter;
  final AssignmentResultRepository _assignmentResultRepository;
  StreamSubscription? _assignmentResultsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int assignmentResultLimit;

  AssignmentResultListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required AssignmentResultRepository assignmentResultRepository,
      this.assignmentResultLimit = 5})
      : _assignmentResultRepository = assignmentResultRepository,
        super(AssignmentResultListLoading()) {
    on<LoadAssignmentResultList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadAssignmentResultListToState();
      } else {
        _mapLoadAssignmentResultListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadAssignmentResultListWithDetailsToState();
    });

    on<AssignmentResultChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadAssignmentResultListToState();
      } else {
        _mapLoadAssignmentResultListWithDetailsToState();
      }
    });

    on<AddAssignmentResultList>((event, emit) async {
      await _mapAddAssignmentResultListToState(event);
    });

    on<UpdateAssignmentResultList>((event, emit) async {
      await _mapUpdateAssignmentResultListToState(event);
    });

    on<DeleteAssignmentResultList>((event, emit) async {
      await _mapDeleteAssignmentResultListToState(event);
    });

    on<AssignmentResultListUpdated>((event, emit) {
      emit(_mapAssignmentResultListUpdatedToState(event));
    });
  }

  List<AssignmentResultModel?> _filter(List<AssignmentResultModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadAssignmentResultListToState() async {
    int amountNow = (state is AssignmentResultListLoaded)
        ? (state as AssignmentResultListLoaded).values!.length
        : 0;
    _assignmentResultsListSubscription?.cancel();
    _assignmentResultsListSubscription = _assignmentResultRepository.listen(
        (list) => add(AssignmentResultListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit:
            ((paged != null) && paged!) ? pages * assignmentResultLimit : null);
  }

  Future<void> _mapLoadAssignmentResultListWithDetailsToState() async {
    int amountNow = (state is AssignmentResultListLoaded)
        ? (state as AssignmentResultListLoaded).values!.length
        : 0;
    _assignmentResultsListSubscription?.cancel();
    _assignmentResultsListSubscription =
        _assignmentResultRepository.listenWithDetails(
            (list) => add(AssignmentResultListUpdated(
                value: _filter(list), mightHaveMore: amountNow != list.length)),
            orderBy: orderBy,
            descending: descending,
            eliudQuery: eliudQuery,
            limit: ((paged != null) && paged!)
                ? pages * assignmentResultLimit
                : null);
  }

  Future<void> _mapAddAssignmentResultListToState(
      AddAssignmentResultList event) async {
    var value = event.value;
    if (value != null) {
      await _assignmentResultRepository.add(value);
    }
  }

  Future<void> _mapUpdateAssignmentResultListToState(
      UpdateAssignmentResultList event) async {
    var value = event.value;
    if (value != null) {
      await _assignmentResultRepository.update(value);
    }
  }

  Future<void> _mapDeleteAssignmentResultListToState(
      DeleteAssignmentResultList event) async {
    var value = event.value;
    if (value != null) {
      await _assignmentResultRepository.delete(value);
    }
  }

  AssignmentResultListLoaded _mapAssignmentResultListUpdatedToState(
          AssignmentResultListUpdated event) =>
      AssignmentResultListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _assignmentResultsListSubscription?.cancel();
    return super.close();
  }
}
