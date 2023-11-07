/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_workflow/model/assignment_view_component_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_component_state.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_repository.dart';

class AssignmentViewComponentBloc
    extends Bloc<AssignmentViewComponentEvent, AssignmentViewComponentState> {
  final AssignmentViewRepository? assignmentViewRepository;
  StreamSubscription? _assignmentViewSubscription;

  void _mapLoadAssignmentViewComponentUpdateToState(String documentId) {
    _assignmentViewSubscription?.cancel();
    _assignmentViewSubscription =
        assignmentViewRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(AssignmentViewComponentUpdated(value: value));
      }
    });
  }

  AssignmentViewComponentBloc({this.assignmentViewRepository})
      : super(AssignmentViewComponentUninitialized()) {
    on<FetchAssignmentViewComponent>((event, emit) {
      _mapLoadAssignmentViewComponentUpdateToState(event.id!);
    });
    on<AssignmentViewComponentUpdated>((event, emit) {
      emit(AssignmentViewComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _assignmentViewSubscription?.cancel();
    return super.close();
  }
}
