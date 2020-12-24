/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_result_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_model.dart';

abstract class AssignmentResultListState extends Equatable {
  const AssignmentResultListState();

  @override
  List<Object> get props => [];
}

class AssignmentResultListLoading extends AssignmentResultListState {}

class AssignmentResultListLoaded extends AssignmentResultListState {
  final List<AssignmentResultModel> values;

  const AssignmentResultListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'AssignmentResultListLoaded { values: $values }';
}

class AssignmentResultNotLoaded extends AssignmentResultListState {}

