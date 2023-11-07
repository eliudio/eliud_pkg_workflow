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

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';

abstract class AssignmentViewListEvent extends Equatable {
  const AssignmentViewListEvent();
  @override
  List<Object?> get props => [];
}

class LoadAssignmentViewList extends AssignmentViewListEvent {}

class NewPage extends AssignmentViewListEvent {}

class AddAssignmentViewList extends AssignmentViewListEvent {
  final AssignmentViewModel? value;

  const AddAssignmentViewList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddAssignmentViewList{ value: $value }';
}

class UpdateAssignmentViewList extends AssignmentViewListEvent {
  final AssignmentViewModel? value;

  const UpdateAssignmentViewList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateAssignmentViewList{ value: $value }';
}

class DeleteAssignmentViewList extends AssignmentViewListEvent {
  final AssignmentViewModel? value;

  const DeleteAssignmentViewList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteAssignmentViewList{ value: $value }';
}

class AssignmentViewListUpdated extends AssignmentViewListEvent {
  final List<AssignmentViewModel?>? value;
  final bool? mightHaveMore;

  const AssignmentViewListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'AssignmentViewListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class AssignmentViewChangeQuery extends AssignmentViewListEvent {
  final EliudQuery? newQuery;

  const AssignmentViewChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'AssignmentViewChangeQuery{ value: $newQuery }';
}
