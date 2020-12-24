/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_task_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_model.dart';

abstract class WorkflowTaskListState extends Equatable {
  const WorkflowTaskListState();

  @override
  List<Object> get props => [];
}

class WorkflowTaskListLoading extends WorkflowTaskListState {}

class WorkflowTaskListLoaded extends WorkflowTaskListState {
  final List<WorkflowTaskModel> values;

  const WorkflowTaskListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'WorkflowTaskListLoaded { values: $values }';
}

class WorkflowTaskNotLoaded extends WorkflowTaskListState {}

