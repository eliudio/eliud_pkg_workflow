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

import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_component_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_component_state.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_repository.dart';
import 'package:flutter/services.dart';

class AssignmentViewComponentBloc extends Bloc<AssignmentViewComponentEvent, AssignmentViewComponentState> {
  final AssignmentViewRepository? assignmentViewRepository;
  StreamSubscription? _assignmentViewSubscription;

  Stream<AssignmentViewComponentState> _mapLoadAssignmentViewComponentUpdateToState(String documentId) async* {
    _assignmentViewSubscription?.cancel();
    _assignmentViewSubscription = assignmentViewRepository!.listenTo(documentId, (value) {
      if (value != null) add(AssignmentViewComponentUpdated(value: value!));
    });
  }

  AssignmentViewComponentBloc({ this.assignmentViewRepository }): super(AssignmentViewComponentUninitialized());

  @override
  Stream<AssignmentViewComponentState> mapEventToState(AssignmentViewComponentEvent event) async* {
    final currentState = state;
    if (event is FetchAssignmentViewComponent) {
      yield* _mapLoadAssignmentViewComponentUpdateToState(event.id!);
    } else if (event is AssignmentViewComponentUpdated) {
      yield AssignmentViewComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _assignmentViewSubscription?.cancel();
    return super.close();
  }

}

