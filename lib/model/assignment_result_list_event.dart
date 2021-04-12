/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_result_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_model.dart';

abstract class AssignmentResultListEvent extends Equatable {
  const AssignmentResultListEvent();
  @override
  List<Object?> get props => [];
}

class LoadAssignmentResultList extends AssignmentResultListEvent {}

class NewPage extends AssignmentResultListEvent {}

class AddAssignmentResultList extends AssignmentResultListEvent {
  final AssignmentResultModel? value;

  const AddAssignmentResultList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddAssignmentResultList{ value: $value }';
}

class UpdateAssignmentResultList extends AssignmentResultListEvent {
  final AssignmentResultModel? value;

  const UpdateAssignmentResultList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateAssignmentResultList{ value: $value }';
}

class DeleteAssignmentResultList extends AssignmentResultListEvent {
  final AssignmentResultModel? value;

  const DeleteAssignmentResultList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteAssignmentResultList{ value: $value }';
}

class AssignmentResultListUpdated extends AssignmentResultListEvent {
  final List<AssignmentResultModel?>? value;
  final bool? mightHaveMore;

  const AssignmentResultListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'AssignmentResultListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

