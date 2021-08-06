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
import 'package:eliud_core/tools/query/query_tools.dart';



class AssignmentResultListBloc extends Bloc<AssignmentResultListEvent, AssignmentResultListState> {
  final AssignmentResultRepository _assignmentResultRepository;
  StreamSubscription? _assignmentResultsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int assignmentResultLimit;

  AssignmentResultListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required AssignmentResultRepository assignmentResultRepository, this.assignmentResultLimit = 5})
      : assert(assignmentResultRepository != null),
        _assignmentResultRepository = assignmentResultRepository,
        super(AssignmentResultListLoading());

  Stream<AssignmentResultListState> _mapLoadAssignmentResultListToState() async* {
    int amountNow =  (state is AssignmentResultListLoaded) ? (state as AssignmentResultListLoaded).values!.length : 0;
    _assignmentResultsListSubscription?.cancel();
    _assignmentResultsListSubscription = _assignmentResultRepository.listen(
          (list) => add(AssignmentResultListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * assignmentResultLimit : null
    );
  }

  Stream<AssignmentResultListState> _mapLoadAssignmentResultListWithDetailsToState() async* {
    int amountNow =  (state is AssignmentResultListLoaded) ? (state as AssignmentResultListLoaded).values!.length : 0;
    _assignmentResultsListSubscription?.cancel();
    _assignmentResultsListSubscription = _assignmentResultRepository.listenWithDetails(
            (list) => add(AssignmentResultListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * assignmentResultLimit : null
    );
  }

  Stream<AssignmentResultListState> _mapAddAssignmentResultListToState(AddAssignmentResultList event) async* {
    var value = event.value;
    if (value != null) 
      _assignmentResultRepository.add(value);
  }

  Stream<AssignmentResultListState> _mapUpdateAssignmentResultListToState(UpdateAssignmentResultList event) async* {
    var value = event.value;
    if (value != null) 
      _assignmentResultRepository.update(value);
  }

  Stream<AssignmentResultListState> _mapDeleteAssignmentResultListToState(DeleteAssignmentResultList event) async* {
    var value = event.value;
    if (value != null) 
      _assignmentResultRepository.delete(value);
  }

  Stream<AssignmentResultListState> _mapAssignmentResultListUpdatedToState(
      AssignmentResultListUpdated event) async* {
    yield AssignmentResultListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<AssignmentResultListState> mapEventToState(AssignmentResultListEvent event) async* {
    if (event is LoadAssignmentResultList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadAssignmentResultListToState();
      } else {
        yield* _mapLoadAssignmentResultListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


