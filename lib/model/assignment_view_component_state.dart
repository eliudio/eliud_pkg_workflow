/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';

/* 
 * AssignmentViewComponentState is the base class for state for AssignmentViewComponentBloc
 */
abstract class AssignmentViewComponentState extends Equatable {
  const AssignmentViewComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * AssignmentViewComponentUninitialized is the uninitialized state of the AssignmentViewComponentBloc 
 */
class AssignmentViewComponentUninitialized
    extends AssignmentViewComponentState {}

/* 
 * AssignmentViewComponentError is the error state of the AssignmentViewComponentBloc 
 */
class AssignmentViewComponentError extends AssignmentViewComponentState {
  final String? message;
  AssignmentViewComponentError({this.message});
}

/* 
 * AssignmentViewComponentPermissionDenied is to indicate permission denied state of the AssignmentViewComponentBloc 
 */
class AssignmentViewComponentPermissionDenied
    extends AssignmentViewComponentState {
  AssignmentViewComponentPermissionDenied();
}

/* 
 * AssignmentViewComponentLoaded is used to set the state of the AssignmentViewComponentBloc to the loaded state
 */
class AssignmentViewComponentLoaded extends AssignmentViewComponentState {
  final AssignmentViewModel value;

  /* 
   * construct AssignmentViewComponentLoaded
   */
  const AssignmentViewComponentLoaded({required this.value});

  /* 
   * copy method
   */
  AssignmentViewComponentLoaded copyWith({AssignmentViewModel? copyThis}) {
    return AssignmentViewComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AssignmentViewComponentLoaded { value: $value }';
}
