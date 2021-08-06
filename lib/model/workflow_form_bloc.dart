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

  WorkflowFormBloc(this.appId, { this.formAction }): super(WorkflowFormUninitialized());
  @override
  Stream<WorkflowFormState> mapEventToState(WorkflowFormEvent event) async* {
    final currentState = state;
    if (currentState is WorkflowFormUninitialized) {
      if (event is InitialiseNewWorkflowFormEvent) {
        WorkflowFormLoaded loaded = WorkflowFormLoaded(value: WorkflowModel(
                                               documentID: "",
                                 name: "",
                                 workflowTask: [],
                                 appId: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseWorkflowFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        WorkflowFormLoaded loaded = WorkflowFormLoaded(value: await workflowRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseWorkflowFormNoLoadEvent) {
        WorkflowFormLoaded loaded = WorkflowFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is WorkflowFormInitialized) {
      WorkflowModel? newValue = null;
      if (event is ChangedWorkflowDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableWorkflowForm(value: newValue);
        }

        return;
      }
      if (event is ChangedWorkflowName) {
        newValue = currentState.value!.copyWith(name: event.value);
        yield SubmittableWorkflowForm(value: newValue);

        return;
      }
      if (event is ChangedWorkflowWorkflowTask) {
        newValue = currentState.value!.copyWith(workflowTask: event.value);
        yield SubmittableWorkflowForm(value: newValue);

        return;
      }
      if (event is ChangedWorkflowAppId) {
        newValue = currentState.value!.copyWith(appId: event.value);
        yield SubmittableWorkflowForm(value: newValue);

        return;
      }
    }
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

