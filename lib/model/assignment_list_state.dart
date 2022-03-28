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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';

abstract class AssignmentListState extends Equatable {
  const AssignmentListState();

  @override
  List<Object?> get props => [];
}

class AssignmentListLoading extends AssignmentListState {}

class AssignmentListLoaded extends AssignmentListState {
  final List<AssignmentModel?>? values;
  final bool? mightHaveMore;

  const AssignmentListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'AssignmentListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is AssignmentListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class AssignmentNotLoaded extends AssignmentListState {}

