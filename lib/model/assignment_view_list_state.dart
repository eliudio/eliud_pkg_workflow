/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';

abstract class AssignmentViewListState extends Equatable {
  const AssignmentViewListState();

  @override
  List<Object> get props => [];
}

class AssignmentViewListLoading extends AssignmentViewListState {}

class AssignmentViewListLoaded extends AssignmentViewListState {
  final List<AssignmentViewModel> values;

  const AssignmentViewListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'AssignmentViewListLoaded { values: $values }';
}

class AssignmentViewNotLoaded extends AssignmentViewListState {}

