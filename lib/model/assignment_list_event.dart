/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';

abstract class AssignmentListEvent extends Equatable {
  const AssignmentListEvent();
  @override
  List<Object> get props => [];
}

class LoadAssignmentList extends AssignmentListEvent {
  final String orderBy;
  final bool descending;

  LoadAssignmentList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadAssignmentListWithDetails extends AssignmentListEvent {}

class AddAssignmentList extends AssignmentListEvent {
  final AssignmentModel value;

  const AddAssignmentList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddAssignmentList{ value: $value }';
}

class UpdateAssignmentList extends AssignmentListEvent {
  final AssignmentModel value;

  const UpdateAssignmentList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateAssignmentList{ value: $value }';
}

class DeleteAssignmentList extends AssignmentListEvent {
  final AssignmentModel value;

  const DeleteAssignmentList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteAssignmentList{ value: $value }';
}

class AssignmentListUpdated extends AssignmentListEvent {
  final List<AssignmentModel> value;

  const AssignmentListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AssignmentListUpdated{ value: $value }';
}

