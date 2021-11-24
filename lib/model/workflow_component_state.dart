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

abstract class WorkflowComponentState extends Equatable {
  const WorkflowComponentState();

  @override
  List<Object?> get props => [];
}

class WorkflowComponentUninitialized extends WorkflowComponentState {}

class WorkflowComponentError extends WorkflowComponentState {
  final String? message;
  WorkflowComponentError({ this.message });
}

class WorkflowComponentPermissionDenied extends WorkflowComponentState {
  WorkflowComponentPermissionDenied();
}

class WorkflowComponentLoaded extends WorkflowComponentState {
  final WorkflowModel value;

  const WorkflowComponentLoaded({ required this.value });

  WorkflowComponentLoaded copyWith({ WorkflowModel? copyThis }) {
    return WorkflowComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'WorkflowComponentLoaded { value: $value }';
}

