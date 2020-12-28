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
class AssignmentViewComponentBloc extends Bloc<AssignmentViewComponentEvent, AssignmentViewComponentState> {
  final AssignmentViewRepository assignmentViewRepository;

  AssignmentViewComponentBloc({ this.assignmentViewRepository }): super(AssignmentViewComponentUninitialized());
  @override
  Stream<AssignmentViewComponentState> mapEventToState(AssignmentViewComponentEvent event) async* {
    final currentState = state;
    if (event is FetchAssignmentViewComponent) {
      try {
        if (currentState is AssignmentViewComponentUninitialized) {
          final AssignmentViewModel model = await _fetchAssignmentView(event.id);

          if (model != null) {
            yield AssignmentViewComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield AssignmentViewComponentError(message: "AssignmentView with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield AssignmentViewComponentError(message: "Unknown error whilst retrieving AssignmentView");
      }
    }
  }

  Future<AssignmentViewModel> _fetchAssignmentView(String id) async {
    return assignmentViewRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


