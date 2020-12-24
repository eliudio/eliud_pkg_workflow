/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';


@immutable
abstract class AssignmentFormEvent extends Equatable {
  const AssignmentFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewAssignmentFormEvent extends AssignmentFormEvent {
}


class InitialiseAssignmentFormEvent extends AssignmentFormEvent {
  final AssignmentModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseAssignmentFormEvent({this.value});
}

class InitialiseAssignmentFormNoLoadEvent extends AssignmentFormEvent {
  final AssignmentModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseAssignmentFormNoLoadEvent({this.value});
}

class ChangedAssignmentDocumentID extends AssignmentFormEvent {
  final String value;

  ChangedAssignmentDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentDocumentID{ value: $value }';
}

class ChangedAssignmentAppId extends AssignmentFormEvent {
  final String value;

  ChangedAssignmentAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentAppId{ value: $value }';
}

class ChangedAssignmentReporter extends AssignmentFormEvent {
  final String value;

  ChangedAssignmentReporter({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentReporter{ value: $value }';
}

class ChangedAssignmentAssignee extends AssignmentFormEvent {
  final String value;

  ChangedAssignmentAssignee({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentAssignee{ value: $value }';
}

class ChangedAssignmentTask extends AssignmentFormEvent {
  final TaskModel value;

  ChangedAssignmentTask({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentTask{ value: $value }';
}

class ChangedAssignmentWorkflow extends AssignmentFormEvent {
  final String value;

  ChangedAssignmentWorkflow({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentWorkflow{ value: $value }';
}

class ChangedAssignmentTriggeringAssignment extends AssignmentFormEvent {
  final String value;

  ChangedAssignmentTriggeringAssignment({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentTriggeringAssignment{ value: $value }';
}

class ChangedAssignmentTimestamp extends AssignmentFormEvent {
  final DateTime value;

  ChangedAssignmentTimestamp({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentTimestamp{ value: $value }';
}

class ChangedAssignmentResults extends AssignmentFormEvent {
  final List<AssignmentResultModel> value;

  ChangedAssignmentResults({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentResults{ value: $value }';
}

