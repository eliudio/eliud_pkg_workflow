/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/workflow_model.dart';

abstract class WorkflowComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchWorkflowComponent extends WorkflowComponentEvent {
  final String? id;

  FetchWorkflowComponent({ this.id });
}

class WorkflowComponentUpdated extends WorkflowComponentEvent {
  final WorkflowModel value;

  WorkflowComponentUpdated({ required this.value });
}


