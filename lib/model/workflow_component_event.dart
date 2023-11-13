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

/*
 * WorkflowComponentEvent is the base class for events to be used with constructing a WorkflowComponentBloc 
 */
abstract class WorkflowComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchWorkflowComponent is the event to instruct the bloc to fetch the component
 */
class FetchWorkflowComponent extends WorkflowComponentEvent {
  final String? id;

  /*
   * Construct the FetchWorkflowComponent
   */
  FetchWorkflowComponent({this.id});
}

/*
 * WorkflowComponentUpdated is the event to inform the bloc that a component has been updated
 */
class WorkflowComponentUpdated extends WorkflowComponentEvent {
  final WorkflowModel value;

  /*
   * Construct the WorkflowComponentUpdated
   */
  WorkflowComponentUpdated({required this.value});
}
