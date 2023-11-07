/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_result_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'assignment_result_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AssignmentResultFormState extends Equatable {
  const AssignmentResultFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class AssignmentResultFormUninitialized extends AssignmentResultFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''AssignmentResultFormState()''';
  }
}

// AssignmentResultModel has been initialised and hence AssignmentResultModel is available
class AssignmentResultFormInitialized extends AssignmentResultFormState {
  final AssignmentResultModel? value;

  @override
  List<Object?> get props => [value];

  const AssignmentResultFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class AssignmentResultFormError
    extends AssignmentResultFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const AssignmentResultFormError({this.message, super.value});

  @override
  String toString() {
    return '''AssignmentResultFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDAssignmentResultFormError extends AssignmentResultFormError {
  const DocumentIDAssignmentResultFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDAssignmentResultFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class KeyAssignmentResultFormError extends AssignmentResultFormError {
  const KeyAssignmentResultFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''KeyAssignmentResultFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ValueAssignmentResultFormError extends AssignmentResultFormError {
  const ValueAssignmentResultFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ValueAssignmentResultFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AssignmentResultFormLoaded extends AssignmentResultFormInitialized {
  const AssignmentResultFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''AssignmentResultFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableAssignmentResultForm extends AssignmentResultFormInitialized {
  const SubmittableAssignmentResultForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableAssignmentResultForm {
      value: $value,
    }''';
  }
}
