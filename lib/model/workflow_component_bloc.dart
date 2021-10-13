/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_workflow/model/workflow_model.dart';
import 'package:eliud_pkg_workflow/model/workflow_component_event.dart';
import 'package:eliud_pkg_workflow/model/workflow_component_state.dart';
import 'package:eliud_pkg_workflow/model/workflow_repository.dart';
import 'package:flutter/services.dart';

class WorkflowComponentBloc extends Bloc<WorkflowComponentEvent, WorkflowComponentState> {
  final WorkflowRepository? workflowRepository;
  StreamSubscription? _workflowSubscription;

  Stream<WorkflowComponentState> _mapLoadWorkflowComponentUpdateToState(String documentId) async* {
    _workflowSubscription?.cancel();
    _workflowSubscription = workflowRepository!.listenTo(documentId, (value) {
      if (value != null) add(WorkflowComponentUpdated(value: value!));
    });
  }

  WorkflowComponentBloc({ this.workflowRepository }): super(WorkflowComponentUninitialized());

  @override
  Stream<WorkflowComponentState> mapEventToState(WorkflowComponentEvent event) async* {
    final currentState = state;
    if (event is FetchWorkflowComponent) {
      yield* _mapLoadWorkflowComponentUpdateToState(event.id!);
    } else if (event is WorkflowComponentUpdated) {
      yield WorkflowComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _workflowSubscription?.cancel();
    return super.close();
  }

}

