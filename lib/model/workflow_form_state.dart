/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'workflow_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WorkflowFormState extends Equatable {
  const WorkflowFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class WorkflowFormUninitialized extends WorkflowFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''WorkflowFormState()''';
  }
}

// WorkflowModel has been initialised and hence WorkflowModel is available
class WorkflowFormInitialized extends WorkflowFormState {
  final WorkflowModel? value;

  @override
  List<Object?> get props => [value];

  const WorkflowFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class WorkflowFormError extends WorkflowFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const WorkflowFormError({this.message, super.value});

  @override
  String toString() {
    return '''WorkflowFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDWorkflowFormError extends WorkflowFormError {
  const DocumentIDWorkflowFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDWorkflowFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class NameWorkflowFormError extends WorkflowFormError {
  const NameWorkflowFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''NameWorkflowFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class WorkflowTaskWorkflowFormError extends WorkflowFormError {
  const WorkflowTaskWorkflowFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''WorkflowTaskWorkflowFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdWorkflowFormError extends WorkflowFormError {
  const AppIdWorkflowFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdWorkflowFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class WorkflowFormLoaded extends WorkflowFormInitialized {
  const WorkflowFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''WorkflowFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableWorkflowForm extends WorkflowFormInitialized {
  const SubmittableWorkflowForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableWorkflowForm {
      value: $value,
    }''';
  }
}
