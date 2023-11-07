/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_task_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:bloc/bloc.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_pkg_workflow/model/model_export.dart';

import 'package:eliud_pkg_workflow/model/workflow_task_form_event.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_form_state.dart';

class WorkflowTaskFormBloc
    extends Bloc<WorkflowTaskFormEvent, WorkflowTaskFormState> {
  final String? appId;

  WorkflowTaskFormBloc(
    this.appId,
  ) : super(WorkflowTaskFormUninitialized()) {
    on<InitialiseNewWorkflowTaskFormEvent>((event, emit) {
      WorkflowTaskFormLoaded loaded = WorkflowTaskFormLoaded(
          value: WorkflowTaskModel(
        documentID: "IDENTIFIER",
        seqNumber: 0,
      ));
      emit(loaded);
    });

    on<InitialiseWorkflowTaskFormEvent>((event, emit) async {
      WorkflowTaskFormLoaded loaded =
          WorkflowTaskFormLoaded(value: event.value);
      emit(loaded);
    });
    on<InitialiseWorkflowTaskFormNoLoadEvent>((event, emit) async {
      WorkflowTaskFormLoaded loaded =
          WorkflowTaskFormLoaded(value: event.value);
      emit(loaded);
    });
    WorkflowTaskModel? newValue;
    on<ChangedWorkflowTaskSeqNumber>((event, emit) async {
      if (state is WorkflowTaskFormInitialized) {
        final currentState = state as WorkflowTaskFormInitialized;
        if (isInt(event.value)) {
          newValue =
              currentState.value!.copyWith(seqNumber: int.parse(event.value!));
          emit(SubmittableWorkflowTaskForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(seqNumber: 0);
          emit(SeqNumberWorkflowTaskFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedWorkflowTaskTask>((event, emit) async {
      if (state is WorkflowTaskFormInitialized) {
        final currentState = state as WorkflowTaskFormInitialized;
        newValue = currentState.value!.copyWith(task: event.value);
        emit(SubmittableWorkflowTaskForm(value: newValue));
      }
    });
    on<ChangedWorkflowTaskConfirmMessage>((event, emit) async {
      if (state is WorkflowTaskFormInitialized) {
        final currentState = state as WorkflowTaskFormInitialized;
        newValue = currentState.value!.copyWith(confirmMessage: event.value);
        emit(SubmittableWorkflowTaskForm(value: newValue));
      }
    });
    on<ChangedWorkflowTaskRejectMessage>((event, emit) async {
      if (state is WorkflowTaskFormInitialized) {
        final currentState = state as WorkflowTaskFormInitialized;
        newValue = currentState.value!.copyWith(rejectMessage: event.value);
        emit(SubmittableWorkflowTaskForm(value: newValue));
      }
    });
    on<ChangedWorkflowTaskResponsible>((event, emit) async {
      if (state is WorkflowTaskFormInitialized) {
        final currentState = state as WorkflowTaskFormInitialized;
        newValue = currentState.value!.copyWith(responsible: event.value);
        emit(SubmittableWorkflowTaskForm(value: newValue));
      }
    });
  }
}
