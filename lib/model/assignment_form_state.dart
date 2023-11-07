/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'assignment_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AssignmentFormState extends Equatable {
  const AssignmentFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class AssignmentFormUninitialized extends AssignmentFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''AssignmentFormState()''';
  }
}

// AssignmentModel has been initialised and hence AssignmentModel is available
class AssignmentFormInitialized extends AssignmentFormState {
  final AssignmentModel? value;

  @override
  List<Object?> get props => [value];

  const AssignmentFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class AssignmentFormError extends AssignmentFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const AssignmentFormError({this.message, super.value});

  @override
  String toString() {
    return '''AssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDAssignmentFormError extends AssignmentFormError {
  const DocumentIDAssignmentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdAssignmentFormError extends AssignmentFormError {
  const AppIdAssignmentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ReporterIdAssignmentFormError extends AssignmentFormError {
  const ReporterIdAssignmentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ReporterIdAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AssigneeIdAssignmentFormError extends AssignmentFormError {
  const AssigneeIdAssignmentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AssigneeIdAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TaskAssignmentFormError extends AssignmentFormError {
  const TaskAssignmentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TaskAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class WorkflowAssignmentFormError extends AssignmentFormError {
  const WorkflowAssignmentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''WorkflowAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class WorkflowTaskSeqNumberAssignmentFormError extends AssignmentFormError {
  const WorkflowTaskSeqNumberAssignmentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''WorkflowTaskSeqNumberAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TimestampAssignmentFormError extends AssignmentFormError {
  const TimestampAssignmentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TimestampAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class StatusAssignmentFormError extends AssignmentFormError {
  const StatusAssignmentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''StatusAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ResultsCurrentAssignmentFormError extends AssignmentFormError {
  const ResultsCurrentAssignmentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ResultsCurrentAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ResultsPreviousAssignmentFormError extends AssignmentFormError {
  const ResultsPreviousAssignmentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ResultsPreviousAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TriggeredByIdAssignmentFormError extends AssignmentFormError {
  const TriggeredByIdAssignmentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TriggeredByIdAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConfirmMessageAssignmentFormError extends AssignmentFormError {
  const ConfirmMessageAssignmentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConfirmMessageAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class RejectMessageAssignmentFormError extends AssignmentFormError {
  const RejectMessageAssignmentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''RejectMessageAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AssignmentFormLoaded extends AssignmentFormInitialized {
  const AssignmentFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''AssignmentFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableAssignmentForm extends AssignmentFormInitialized {
  const SubmittableAssignmentForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableAssignmentForm {
      value: $value,
    }''';
  }
}
