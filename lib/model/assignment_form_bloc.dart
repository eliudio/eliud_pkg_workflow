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

import 'dart:async';

import 'package:bloc/bloc.dart';
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

import 'package:eliud_pkg_workflow/model/assignment_form_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_form_state.dart';
import 'package:eliud_pkg_workflow/model/assignment_repository.dart';

class AssignmentFormBloc extends Bloc<AssignmentFormEvent, AssignmentFormState> {
  final FormAction formAction;
  final String appId;

  AssignmentFormBloc(this.appId, { this.formAction }): super(AssignmentFormUninitialized());
  @override
  Stream<AssignmentFormState> mapEventToState(AssignmentFormEvent event) async* {
    final currentState = state;
    if (currentState is AssignmentFormUninitialized) {
      if (event is InitialiseNewAssignmentFormEvent) {
        AssignmentFormLoaded loaded = AssignmentFormLoaded(value: AssignmentModel(
                                               documentID: "IDENTIFIER", 
                                 appId: "",
                                 assigneeId: "",
                                 resultsFromPreviousAssignment: [],

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseAssignmentFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        AssignmentFormLoaded loaded = AssignmentFormLoaded(value: await assignmentRepository(appId: appId).get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseAssignmentFormNoLoadEvent) {
        AssignmentFormLoaded loaded = AssignmentFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is AssignmentFormInitialized) {
      AssignmentModel newValue = null;
      if (event is ChangedAssignmentAppId) {
        newValue = currentState.value.copyWith(appId: event.value);
        yield SubmittableAssignmentForm(value: newValue);

        return;
      }
      if (event is ChangedAssignmentReporter) {
        if (event.value != null)
          newValue = currentState.value.copyWith(reporter: await memberRepository(appId: appId).get(event.value));
        else
          newValue = new AssignmentModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 reporter: null,
                                 assigneeId: currentState.value.assigneeId,
                                 task: currentState.value.task,
                                 workflow: currentState.value.workflow,
                                 timestamp: currentState.value.timestamp,
                                 status: currentState.value.status,
                                 resultsFromPreviousAssignment: currentState.value.resultsFromPreviousAssignment,
                                 triggeredBy: currentState.value.triggeredBy,
          );
        yield SubmittableAssignmentForm(value: newValue);

        return;
      }
      if (event is ChangedAssignmentAssigneeId) {
        newValue = currentState.value.copyWith(assigneeId: event.value);
        yield SubmittableAssignmentForm(value: newValue);

        return;
      }
      if (event is ChangedAssignmentTask) {
        newValue = currentState.value.copyWith(task: event.value);
        yield SubmittableAssignmentForm(value: newValue);

        return;
      }
      if (event is ChangedAssignmentWorkflow) {
        if (event.value != null)
          newValue = currentState.value.copyWith(workflow: await workflowRepository(appId: appId).get(event.value));
        else
          newValue = new AssignmentModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 reporter: currentState.value.reporter,
                                 assigneeId: currentState.value.assigneeId,
                                 task: currentState.value.task,
                                 workflow: null,
                                 timestamp: currentState.value.timestamp,
                                 status: currentState.value.status,
                                 resultsFromPreviousAssignment: currentState.value.resultsFromPreviousAssignment,
                                 triggeredBy: currentState.value.triggeredBy,
          );
        yield SubmittableAssignmentForm(value: newValue);

        return;
      }
      if (event is ChangedAssignmentTimestamp) {
        newValue = currentState.value.copyWith(timestamp: event.value);
        yield SubmittableAssignmentForm(value: newValue);

        return;
      }
      if (event is ChangedAssignmentStatus) {
        newValue = currentState.value.copyWith(status: event.value);
        yield SubmittableAssignmentForm(value: newValue);

        return;
      }
      if (event is ChangedAssignmentResultsFromPreviousAssignment) {
        newValue = currentState.value.copyWith(resultsFromPreviousAssignment: event.value);
        yield SubmittableAssignmentForm(value: newValue);

        return;
      }
      if (event is ChangedAssignmentTriggeredBy) {
        if (event.value != null)
          newValue = currentState.value.copyWith(triggeredBy: await assignmentRepository(appId: appId).get(event.value));
        else
          newValue = new AssignmentModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 reporter: currentState.value.reporter,
                                 assigneeId: currentState.value.assigneeId,
                                 task: currentState.value.task,
                                 workflow: currentState.value.workflow,
                                 timestamp: currentState.value.timestamp,
                                 status: currentState.value.status,
                                 resultsFromPreviousAssignment: currentState.value.resultsFromPreviousAssignment,
                                 triggeredBy: null,
          );
        yield SubmittableAssignmentForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDAssignmentFormError error(String message, AssignmentModel newValue) => DocumentIDAssignmentFormError(message: message, value: newValue);

  Future<AssignmentFormState> _isDocumentIDValid(String value, AssignmentModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<AssignmentModel> findDocument = assignmentRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableAssignmentForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

