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
class WorkflowComponentBloc extends Bloc<WorkflowComponentEvent, WorkflowComponentState> {
  final WorkflowRepository workflowRepository;

  WorkflowComponentBloc({ this.workflowRepository }): super(WorkflowComponentUninitialized());
  @override
  Stream<WorkflowComponentState> mapEventToState(WorkflowComponentEvent event) async* {
    final currentState = state;
    if (event is FetchWorkflowComponent) {
      try {
        if (currentState is WorkflowComponentUninitialized) {
          final WorkflowModel model = await _fetchWorkflow(event.id);

          if (model != null) {
            yield WorkflowComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield WorkflowComponentError(message: "Workflow with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield WorkflowComponentError(message: "Unknown error whilst retrieving Workflow");
      }
    }
  }

  Future<WorkflowModel> _fetchWorkflow(String id) async {
    return workflowRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

