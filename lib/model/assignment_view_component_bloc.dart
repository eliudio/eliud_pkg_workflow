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

  AssignmentViewComponentBloc({ this.assignmentViewRepository }): super(AssignmentViewComponentUninitialized());
  @override
  Stream<AssignmentViewComponentState> mapEventToState(AssignmentViewComponentEvent event) async* {
    final currentState = state;
    if (event is FetchAssignmentViewComponent) {
      try {
        if (currentState is AssignmentViewComponentUninitialized) {
          bool permissionDenied = false;
          final model = await assignmentViewRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield AssignmentViewComponentPermissionDenied();
          } else {
            if (model != null) {
              yield AssignmentViewComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield AssignmentViewComponentError(
                  message: "AssignmentView with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield AssignmentViewComponentError(message: "Unknown error whilst retrieving AssignmentView");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

