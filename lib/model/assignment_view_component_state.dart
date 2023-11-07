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

abstract class AssignmentViewComponentState extends Equatable {
  const AssignmentViewComponentState();

  @override
  List<Object?> get props => [];
}

class AssignmentViewComponentUninitialized
    extends AssignmentViewComponentState {}

class AssignmentViewComponentError extends AssignmentViewComponentState {
  final String? message;
  AssignmentViewComponentError({this.message});
}

class AssignmentViewComponentPermissionDenied
    extends AssignmentViewComponentState {
  AssignmentViewComponentPermissionDenied();
}

class AssignmentViewComponentLoaded extends AssignmentViewComponentState {
  final AssignmentViewModel value;

  const AssignmentViewComponentLoaded({required this.value});

  AssignmentViewComponentLoaded copyWith({AssignmentViewModel? copyThis}) {
    return AssignmentViewComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AssignmentViewComponentLoaded { value: $value }';
}
