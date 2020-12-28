/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';

abstract class AssignmentViewListEvent extends Equatable {
  const AssignmentViewListEvent();
  @override
  List<Object> get props => [];
}

class LoadAssignmentViewList extends AssignmentViewListEvent {
  final String orderBy;
  final bool descending;

  LoadAssignmentViewList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadAssignmentViewListWithDetails extends AssignmentViewListEvent {}

class AddAssignmentViewList extends AssignmentViewListEvent {
  final AssignmentViewModel value;

  const AddAssignmentViewList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddAssignmentViewList{ value: $value }';
}

class UpdateAssignmentViewList extends AssignmentViewListEvent {
  final AssignmentViewModel value;

  const UpdateAssignmentViewList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateAssignmentViewList{ value: $value }';
}

class DeleteAssignmentViewList extends AssignmentViewListEvent {
  final AssignmentViewModel value;

  const DeleteAssignmentViewList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteAssignmentViewList{ value: $value }';
}

class AssignmentViewListUpdated extends AssignmentViewListEvent {
  final List<AssignmentViewModel> value;

  const AssignmentViewListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AssignmentViewListUpdated{ value: $value }';
}

