/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:bloc/bloc.dart';
import 'package:eliud_core_model/tools/firestore/firestore_tools.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';

import 'package:eliud_pkg_workflow/model/assignment_form_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_form_state.dart';

class AssignmentFormBloc
    extends Bloc<AssignmentFormEvent, AssignmentFormState> {
  final FormAction? formAction;
  final String? appId;

  AssignmentFormBloc(this.appId, {this.formAction})
      : super(AssignmentFormUninitialized()) {
    on<InitialiseNewAssignmentFormEvent>((event, emit) {
      AssignmentFormLoaded loaded = AssignmentFormLoaded(
          value: AssignmentModel(
        documentID: "IDENTIFIER",
        appId: "",
        reporterId: "",
        assigneeId: "",
        workflowTaskSeqNumber: 0,
        resultsCurrent: [],
        resultsPrevious: [],
        triggeredById: "",
      ));
      emit(loaded);
    });

    on<InitialiseAssignmentFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      AssignmentFormLoaded loaded = AssignmentFormLoaded(
          value: await assignmentRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseAssignmentFormNoLoadEvent>((event, emit) async {
      AssignmentFormLoaded loaded = AssignmentFormLoaded(value: event.value);
      emit(loaded);
    });
    AssignmentModel? newValue;
    on<ChangedAssignmentAppId>((event, emit) async {
      if (state is AssignmentFormInitialized) {
        final currentState = state as AssignmentFormInitialized;
        newValue = currentState.value!.copyWith(appId: event.value);
        emit(SubmittableAssignmentForm(value: newValue));
      }
    });
    on<ChangedAssignmentReporterId>((event, emit) async {
      if (state is AssignmentFormInitialized) {
        final currentState = state as AssignmentFormInitialized;
        newValue = currentState.value!.copyWith(reporterId: event.value);
        emit(SubmittableAssignmentForm(value: newValue));
      }
    });
    on<ChangedAssignmentAssigneeId>((event, emit) async {
      if (state is AssignmentFormInitialized) {
        final currentState = state as AssignmentFormInitialized;
        newValue = currentState.value!.copyWith(assigneeId: event.value);
        emit(SubmittableAssignmentForm(value: newValue));
      }
    });
    on<ChangedAssignmentTask>((event, emit) async {
      if (state is AssignmentFormInitialized) {
        final currentState = state as AssignmentFormInitialized;
        newValue = currentState.value!.copyWith(task: event.value);
        emit(SubmittableAssignmentForm(value: newValue));
      }
    });
    on<ChangedAssignmentWorkflow>((event, emit) async {
      if (state is AssignmentFormInitialized) {
        final currentState = state as AssignmentFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              workflow:
                  await workflowRepository(appId: appId)!.get(event.value));
        }
        emit(SubmittableAssignmentForm(value: newValue));
      }
    });
    on<ChangedAssignmentWorkflowTaskSeqNumber>((event, emit) async {
      if (state is AssignmentFormInitialized) {
        final currentState = state as AssignmentFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!
              .copyWith(workflowTaskSeqNumber: int.parse(event.value!));
          emit(SubmittableAssignmentForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(workflowTaskSeqNumber: 0);
          emit(WorkflowTaskSeqNumberAssignmentFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedAssignmentTimestamp>((event, emit) async {
      if (state is AssignmentFormInitialized) {
        final currentState = state as AssignmentFormInitialized;
        newValue = currentState.value!
            .copyWith(timestamp: dateTimeFromTimestampString(event.value!));
        emit(SubmittableAssignmentForm(value: newValue));
      }
    });
    on<ChangedAssignmentStatus>((event, emit) async {
      if (state is AssignmentFormInitialized) {
        final currentState = state as AssignmentFormInitialized;
        newValue = currentState.value!.copyWith(status: event.value);
        emit(SubmittableAssignmentForm(value: newValue));
      }
    });
    on<ChangedAssignmentResultsCurrent>((event, emit) async {
      if (state is AssignmentFormInitialized) {
        final currentState = state as AssignmentFormInitialized;
        newValue = currentState.value!.copyWith(resultsCurrent: event.value);
        emit(SubmittableAssignmentForm(value: newValue));
      }
    });
    on<ChangedAssignmentResultsPrevious>((event, emit) async {
      if (state is AssignmentFormInitialized) {
        final currentState = state as AssignmentFormInitialized;
        newValue = currentState.value!.copyWith(resultsPrevious: event.value);
        emit(SubmittableAssignmentForm(value: newValue));
      }
    });
    on<ChangedAssignmentTriggeredById>((event, emit) async {
      if (state is AssignmentFormInitialized) {
        final currentState = state as AssignmentFormInitialized;
        newValue = currentState.value!.copyWith(triggeredById: event.value);
        emit(SubmittableAssignmentForm(value: newValue));
      }
    });
    on<ChangedAssignmentConfirmMessage>((event, emit) async {
      if (state is AssignmentFormInitialized) {
        final currentState = state as AssignmentFormInitialized;
        newValue = currentState.value!.copyWith(confirmMessage: event.value);
        emit(SubmittableAssignmentForm(value: newValue));
      }
    });
    on<ChangedAssignmentRejectMessage>((event, emit) async {
      if (state is AssignmentFormInitialized) {
        final currentState = state as AssignmentFormInitialized;
        newValue = currentState.value!.copyWith(rejectMessage: event.value);
        emit(SubmittableAssignmentForm(value: newValue));
      }
    });
  }
}
