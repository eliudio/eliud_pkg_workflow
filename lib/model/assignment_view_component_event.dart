/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';

/*
 * AssignmentViewComponentEvent is the base class for events to be used with constructing a AssignmentViewComponentBloc 
 */
abstract class AssignmentViewComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchAssignmentViewComponent is the event to instruct the bloc to fetch the component
 */
class FetchAssignmentViewComponent extends AssignmentViewComponentEvent {
  final String? id;

  /*
   * Construct the FetchAssignmentViewComponent
   */
  FetchAssignmentViewComponent({this.id});
}

/*
 * AssignmentViewComponentUpdated is the event to inform the bloc that a component has been updated
 */
class AssignmentViewComponentUpdated extends AssignmentViewComponentEvent {
  final AssignmentViewModel value;

  /*
   * Construct the AssignmentViewComponentUpdated
   */
  AssignmentViewComponentUpdated({required this.value});
}
