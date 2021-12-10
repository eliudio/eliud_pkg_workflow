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
  List<Object?> get props => [];
}

class InitialiseNewAssignmentFormEvent extends AssignmentFormEvent {
}


class InitialiseAssignmentFormEvent extends AssignmentFormEvent {
  final AssignmentModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseAssignmentFormEvent({this.value});
}

class InitialiseAssignmentFormNoLoadEvent extends AssignmentFormEvent {
  final AssignmentModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseAssignmentFormNoLoadEvent({this.value});
}

class ChangedAssignmentDocumentID extends AssignmentFormEvent {
  final String? value;

  ChangedAssignmentDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentDocumentID{ value: $value }';
}

class ChangedAssignmentAppId extends AssignmentFormEvent {
  final String? value;

  ChangedAssignmentAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentAppId{ value: $value }';
}

class ChangedAssignmentReporterId extends AssignmentFormEvent {
  final String? value;

  ChangedAssignmentReporterId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentReporterId{ value: $value }';
}

class ChangedAssignmentAssigneeId extends AssignmentFormEvent {
  final String? value;

  ChangedAssignmentAssigneeId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentAssigneeId{ value: $value }';
}

class ChangedAssignmentTask extends AssignmentFormEvent {
  final TaskModel? value;

  ChangedAssignmentTask({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentTask{ value: $value }';
}

class ChangedAssignmentWorkflow extends AssignmentFormEvent {
  final String? value;

  ChangedAssignmentWorkflow({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentWorkflow{ value: $value }';
}

class ChangedAssignmentWorkflowTaskSeqNumber extends AssignmentFormEvent {
  final String? value;

  ChangedAssignmentWorkflowTaskSeqNumber({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentWorkflowTaskSeqNumber{ value: $value }';
}

class ChangedAssignmentTimestamp extends AssignmentFormEvent {
  final String? value;

  ChangedAssignmentTimestamp({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentTimestamp{ value: $value }';
}

class ChangedAssignmentStatus extends AssignmentFormEvent {
  final AssignmentStatus? value;

  ChangedAssignmentStatus({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentStatus{ value: $value }';
}

class ChangedAssignmentResultsCurrent extends AssignmentFormEvent {
  final List<AssignmentResultModel>? value;

  ChangedAssignmentResultsCurrent({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentResultsCurrent{ value: $value }';
}

class ChangedAssignmentResultsPrevious extends AssignmentFormEvent {
  final List<AssignmentResultModel>? value;

  ChangedAssignmentResultsPrevious({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentResultsPrevious{ value: $value }';
}

class ChangedAssignmentTriggeredById extends AssignmentFormEvent {
  final String? value;

  ChangedAssignmentTriggeredById({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentTriggeredById{ value: $value }';
}

class ChangedAssignmentConfirmMessage extends AssignmentFormEvent {
  final WorkflowNotificationModel? value;

  ChangedAssignmentConfirmMessage({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentConfirmMessage{ value: $value }';
}

class ChangedAssignmentRejectMessage extends AssignmentFormEvent {
  final WorkflowNotificationModel? value;

  ChangedAssignmentRejectMessage({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAssignmentRejectMessage{ value: $value }';
}

