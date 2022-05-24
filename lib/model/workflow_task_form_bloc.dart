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

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

import 'package:eliud_pkg_workflow/model/workflow_task_form_event.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_form_state.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_repository.dart';

class WorkflowTaskFormBloc extends Bloc<WorkflowTaskFormEvent, WorkflowTaskFormState> {
  final String? appId;

  WorkflowTaskFormBloc(this.appId, ): super(WorkflowTaskFormUninitialized());
  @override
  Stream<WorkflowTaskFormState> mapEventToState(WorkflowTaskFormEvent event) async* {
    final currentState = state;
    if (currentState is WorkflowTaskFormUninitialized) {
      on <InitialiseNewWorkflowTaskFormEvent> ((event, emit) {
        WorkflowTaskFormLoaded loaded = WorkflowTaskFormLoaded(value: WorkflowTaskModel(
                                               documentID: "IDENTIFIER", 
                                 seqNumber: 0,

        ));
        emit(loaded);
      });


      if (event is InitialiseWorkflowTaskFormEvent) {
        WorkflowTaskFormLoaded loaded = WorkflowTaskFormLoaded(value: event.value);
        emit(loaded);
      } else if (event is InitialiseWorkflowTaskFormNoLoadEvent) {
        WorkflowTaskFormLoaded loaded = WorkflowTaskFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is WorkflowTaskFormInitialized) {
      WorkflowTaskModel? newValue = null;
      on <ChangedWorkflowTaskSeqNumber> ((event, emit) async {
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(seqNumber: int.parse(event.value!));
          emit(SubmittableWorkflowTaskForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(seqNumber: 0);
          emit(SeqNumberWorkflowTaskFormError(message: "Value should be a number", value: newValue));
        }
      });
      on <ChangedWorkflowTaskTask> ((event, emit) async {
        newValue = currentState.value!.copyWith(task: event.value);
        emit(SubmittableWorkflowTaskForm(value: newValue));

      });
      on <ChangedWorkflowTaskConfirmMessage> ((event, emit) async {
        newValue = currentState.value!.copyWith(confirmMessage: event.value);
        emit(SubmittableWorkflowTaskForm(value: newValue));

      });
      on <ChangedWorkflowTaskRejectMessage> ((event, emit) async {
        newValue = currentState.value!.copyWith(rejectMessage: event.value);
        emit(SubmittableWorkflowTaskForm(value: newValue));

      });
      on <ChangedWorkflowTaskResponsible> ((event, emit) async {
        newValue = currentState.value!.copyWith(responsible: event.value);
        emit(SubmittableWorkflowTaskForm(value: newValue));

      });
    }
  }


}

