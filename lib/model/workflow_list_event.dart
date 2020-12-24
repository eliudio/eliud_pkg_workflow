/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/workflow_model.dart';

abstract class WorkflowListEvent extends Equatable {
  const WorkflowListEvent();
  @override
  List<Object> get props => [];
}

class LoadWorkflowList extends WorkflowListEvent {
  final String orderBy;
  final bool descending;

  LoadWorkflowList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadWorkflowListWithDetails extends WorkflowListEvent {}

class AddWorkflowList extends WorkflowListEvent {
  final WorkflowModel value;

  const AddWorkflowList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddWorkflowList{ value: $value }';
}

class UpdateWorkflowList extends WorkflowListEvent {
  final WorkflowModel value;

  const UpdateWorkflowList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateWorkflowList{ value: $value }';
}

class DeleteWorkflowList extends WorkflowListEvent {
  final WorkflowModel value;

  const DeleteWorkflowList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteWorkflowList{ value: $value }';
}

class WorkflowListUpdated extends WorkflowListEvent {
  final List<WorkflowModel> value;

  const WorkflowListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'WorkflowListUpdated{ value: $value }';
}

