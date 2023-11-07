/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'assignment_view_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AssignmentViewFormState extends Equatable {
  const AssignmentViewFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class AssignmentViewFormUninitialized extends AssignmentViewFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''AssignmentViewFormState()''';
  }
}

// AssignmentViewModel has been initialised and hence AssignmentViewModel is available
class AssignmentViewFormInitialized extends AssignmentViewFormState {
  final AssignmentViewModel? value;

  @override
  List<Object?> get props => [value];

  const AssignmentViewFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class AssignmentViewFormError extends AssignmentViewFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const AssignmentViewFormError({this.message, super.value});

  @override
  String toString() {
    return '''AssignmentViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDAssignmentViewFormError extends AssignmentViewFormError {
  const DocumentIDAssignmentViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDAssignmentViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdAssignmentViewFormError extends AssignmentViewFormError {
  const AppIdAssignmentViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdAssignmentViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TitleAssignmentViewFormError extends AssignmentViewFormError {
  const TitleAssignmentViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TitleAssignmentViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionAssignmentViewFormError extends AssignmentViewFormError {
  const DescriptionAssignmentViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionAssignmentViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsAssignmentViewFormError extends AssignmentViewFormError {
  const ConditionsAssignmentViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsAssignmentViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AssignmentViewFormLoaded extends AssignmentViewFormInitialized {
  const AssignmentViewFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''AssignmentViewFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableAssignmentViewForm extends AssignmentViewFormInitialized {
  const SubmittableAssignmentViewForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableAssignmentViewForm {
      value: $value,
    }''';
  }
}
