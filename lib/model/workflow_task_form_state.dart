/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_task_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'workflow_task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WorkflowTaskFormState extends Equatable {
  const WorkflowTaskFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class WorkflowTaskFormUninitialized extends WorkflowTaskFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''WorkflowTaskFormState()''';
  }
}

// WorkflowTaskModel has been initialised and hence WorkflowTaskModel is available
class WorkflowTaskFormInitialized extends WorkflowTaskFormState {
  final WorkflowTaskModel? value;

  @override
  List<Object?> get props => [value];

  const WorkflowTaskFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class WorkflowTaskFormError extends WorkflowTaskFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const WorkflowTaskFormError({this.message, super.value});

  @override
  String toString() {
    return '''WorkflowTaskFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDWorkflowTaskFormError extends WorkflowTaskFormError {
  const DocumentIDWorkflowTaskFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDWorkflowTaskFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class SeqNumberWorkflowTaskFormError extends WorkflowTaskFormError {
  const SeqNumberWorkflowTaskFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''SeqNumberWorkflowTaskFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TaskWorkflowTaskFormError extends WorkflowTaskFormError {
  const TaskWorkflowTaskFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TaskWorkflowTaskFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConfirmMessageWorkflowTaskFormError extends WorkflowTaskFormError {
  const ConfirmMessageWorkflowTaskFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConfirmMessageWorkflowTaskFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class RejectMessageWorkflowTaskFormError extends WorkflowTaskFormError {
  const RejectMessageWorkflowTaskFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''RejectMessageWorkflowTaskFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ResponsibleWorkflowTaskFormError extends WorkflowTaskFormError {
  const ResponsibleWorkflowTaskFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ResponsibleWorkflowTaskFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class WorkflowTaskFormLoaded extends WorkflowTaskFormInitialized {
  const WorkflowTaskFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''WorkflowTaskFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableWorkflowTaskForm extends WorkflowTaskFormInitialized {
  const SubmittableWorkflowTaskForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableWorkflowTaskForm {
      value: $value,
    }''';
  }
}
