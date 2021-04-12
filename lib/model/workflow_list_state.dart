/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/workflow_model.dart';

abstract class WorkflowListState extends Equatable {
  const WorkflowListState();

  @override
  List<Object?> get props => [];
}

class WorkflowListLoading extends WorkflowListState {}

class WorkflowListLoaded extends WorkflowListState {
  final List<WorkflowModel?>? values;
  final bool? mightHaveMore;

  const WorkflowListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'WorkflowListLoaded { values: $values }';
}

class WorkflowNotLoaded extends WorkflowListState {}

