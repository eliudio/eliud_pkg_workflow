/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_task_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_model.dart';

abstract class WorkflowTaskListEvent extends Equatable {
  const WorkflowTaskListEvent();
  @override
  List<Object?> get props => [];
}

class LoadWorkflowTaskList extends WorkflowTaskListEvent {}

class NewPage extends WorkflowTaskListEvent {}

class AddWorkflowTaskList extends WorkflowTaskListEvent {
  final WorkflowTaskModel? value;

  const AddWorkflowTaskList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddWorkflowTaskList{ value: $value }';
}

class UpdateWorkflowTaskList extends WorkflowTaskListEvent {
  final WorkflowTaskModel? value;

  const UpdateWorkflowTaskList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateWorkflowTaskList{ value: $value }';
}

class DeleteWorkflowTaskList extends WorkflowTaskListEvent {
  final WorkflowTaskModel? value;

  const DeleteWorkflowTaskList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteWorkflowTaskList{ value: $value }';
}

class WorkflowTaskListUpdated extends WorkflowTaskListEvent {
  final List<WorkflowTaskModel?>? value;
  final bool? mightHaveMore;

  const WorkflowTaskListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'WorkflowTaskListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class WorkflowTaskChangeQuery extends WorkflowTaskListEvent {
  final EliudQuery? newQuery;

  const WorkflowTaskChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'WorkflowTaskChangeQuery{ value: $newQuery }';
}

