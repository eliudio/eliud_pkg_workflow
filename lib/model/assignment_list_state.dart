/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';

abstract class AssignmentListState extends Equatable {
  const AssignmentListState();

  @override
  List<Object> get props => [];
}

class AssignmentListLoading extends AssignmentListState {}

class AssignmentListLoaded extends AssignmentListState {
  final List<AssignmentModel> values;

  const AssignmentListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'AssignmentListLoaded { values: $values }';
}

class AssignmentNotLoaded extends AssignmentListState {}

