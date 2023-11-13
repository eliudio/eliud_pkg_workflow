/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/workflow_model.dart';

/* 
 * WorkflowComponentState is the base class for state for WorkflowComponentBloc
 */
abstract class WorkflowComponentState extends Equatable {
  const WorkflowComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * WorkflowComponentUninitialized is the uninitialized state of the WorkflowComponentBloc 
 */
class WorkflowComponentUninitialized extends WorkflowComponentState {}

/* 
 * WorkflowComponentError is the error state of the WorkflowComponentBloc 
 */
class WorkflowComponentError extends WorkflowComponentState {
  final String? message;
  WorkflowComponentError({this.message});
}

/* 
 * WorkflowComponentPermissionDenied is to indicate permission denied state of the WorkflowComponentBloc 
 */
class WorkflowComponentPermissionDenied extends WorkflowComponentState {
  WorkflowComponentPermissionDenied();
}

/* 
 * WorkflowComponentLoaded is used to set the state of the WorkflowComponentBloc to the loaded state
 */
class WorkflowComponentLoaded extends WorkflowComponentState {
  final WorkflowModel value;

  /* 
   * construct WorkflowComponentLoaded
   */
  const WorkflowComponentLoaded({required this.value});

  /* 
   * copy method
   */
  WorkflowComponentLoaded copyWith({WorkflowModel? copyThis}) {
    return WorkflowComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'WorkflowComponentLoaded { value: $value }';
}
