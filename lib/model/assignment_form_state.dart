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
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class AssignmentFormUninitialized extends AssignmentFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''AssignmentFormState()''';
  }
}

// AssignmentModel has been initialised and hence AssignmentModel is available
class AssignmentFormInitialized extends AssignmentFormState {
  final AssignmentModel value;

  @override
  List<Object> get props => [ value ];

  const AssignmentFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class AssignmentFormError extends AssignmentFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const AssignmentFormError({this.message, AssignmentModel value }) : super(value: value);

  @override
  String toString() {
    return '''AssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDAssignmentFormError extends AssignmentFormError { 
  const DocumentIDAssignmentFormError({ String message, AssignmentModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdAssignmentFormError extends AssignmentFormError { 
  const AppIdAssignmentFormError({ String message, AssignmentModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ReporterAssignmentFormError extends AssignmentFormError { 
  const ReporterAssignmentFormError({ String message, AssignmentModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ReporterAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AssigneeAssignmentFormError extends AssignmentFormError { 
  const AssigneeAssignmentFormError({ String message, AssignmentModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AssigneeAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TaskAssignmentFormError extends AssignmentFormError { 
  const TaskAssignmentFormError({ String message, AssignmentModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''TaskAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class WorkflowAssignmentFormError extends AssignmentFormError { 
  const WorkflowAssignmentFormError({ String message, AssignmentModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''WorkflowAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TimestampAssignmentFormError extends AssignmentFormError { 
  const TimestampAssignmentFormError({ String message, AssignmentModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''TimestampAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ResultsAssignmentFormError extends AssignmentFormError { 
  const ResultsAssignmentFormError({ String message, AssignmentModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ResultsAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TriggeredByAssignmentFormError extends AssignmentFormError { 
  const TriggeredByAssignmentFormError({ String message, AssignmentModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''TriggeredByAssignmentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AssignmentFormLoaded extends AssignmentFormInitialized { 
  const AssignmentFormLoaded({ AssignmentModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''AssignmentFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableAssignmentForm extends AssignmentFormInitialized { 
  const SubmittableAssignmentForm({ AssignmentModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableAssignmentForm {
      value: $value,
    }''';
  }
}

