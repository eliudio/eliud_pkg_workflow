/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_form_bloc.dart
                       
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

import 'package:eliud_pkg_workflow/model/workflow_form_event.dart';
import 'package:eliud_pkg_workflow/model/workflow_form_state.dart';
import 'package:eliud_pkg_workflow/model/workflow_repository.dart';

class WorkflowFormBloc extends Bloc<WorkflowFormEvent, WorkflowFormState> {
  final FormAction? formAction;
  final String? appId;

  WorkflowFormBloc(this.appId, { this.formAction }): super(WorkflowFormUninitialized()) {
      on <InitialiseNewWorkflowFormEvent> ((event, emit) {
        WorkflowFormLoaded loaded = WorkflowFormLoaded(value: WorkflowModel(
                                               documentID: "",
                                 name: "",
                                 workflowTask: [],
                                 appId: "",

        ));
        emit(loaded);
      });


      on <InitialiseWorkflowFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        WorkflowFormLoaded loaded = WorkflowFormLoaded(value: await workflowRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialiseWorkflowFormNoLoadEvent> ((event, emit) async {
        WorkflowFormLoaded loaded = WorkflowFormLoaded(value: event.value);
        emit(loaded);
      });
      WorkflowModel? newValue = null;
      on <ChangedWorkflowDocumentID> ((event, emit) async {
      if (state is WorkflowFormInitialized) {
        final currentState = state as WorkflowFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableWorkflowForm(value: newValue));
        }

      }
      });
      on <ChangedWorkflowName> ((event, emit) async {
      if (state is WorkflowFormInitialized) {
        final currentState = state as WorkflowFormInitialized;
        newValue = currentState.value!.copyWith(name: event.value);
        emit(SubmittableWorkflowForm(value: newValue));

      }
      });
      on <ChangedWorkflowWorkflowTask> ((event, emit) async {
      if (state is WorkflowFormInitialized) {
        final currentState = state as WorkflowFormInitialized;
        newValue = currentState.value!.copyWith(workflowTask: event.value);
        emit(SubmittableWorkflowForm(value: newValue));

      }
      });
      on <ChangedWorkflowAppId> ((event, emit) async {
      if (state is WorkflowFormInitialized) {
        final currentState = state as WorkflowFormInitialized;
        newValue = currentState.value!.copyWith(appId: event.value);
        emit(SubmittableWorkflowForm(value: newValue));

      }
      });
  }


  DocumentIDWorkflowFormError error(String message, WorkflowModel newValue) => DocumentIDWorkflowFormError(message: message, value: newValue);

  Future<WorkflowFormState> _isDocumentIDValid(String? value, WorkflowModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<WorkflowModel?> findDocument = workflowRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableWorkflowForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

