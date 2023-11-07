/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_result_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';

@immutable
abstract class AssignmentResultFormEvent extends Equatable {
  const AssignmentResultFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewAssignmentResultFormEvent
    extends AssignmentResultFormEvent {}

class InitialiseAssignmentResultFormEvent extends AssignmentResultFormEvent {
  final AssignmentResultModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseAssignmentResultFormEvent({this.value});
}

class InitialiseAssignmentResultFormNoLoadEvent
    extends AssignmentResultFormEvent {
  final AssignmentResultModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseAssignmentResultFormNoLoadEvent({this.value});
}

class ChangedAssignmentResultDocumentID extends AssignmentResultFormEvent {
  final String? value;

  ChangedAssignmentResultDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAssignmentResultDocumentID{ value: $value }';
}

class ChangedAssignmentResultKey extends AssignmentResultFormEvent {
  final String? value;

  ChangedAssignmentResultKey({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAssignmentResultKey{ value: $value }';
}

class ChangedAssignmentResultValue extends AssignmentResultFormEvent {
  final String? value;

  ChangedAssignmentResultValue({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAssignmentResultValue{ value: $value }';
}
