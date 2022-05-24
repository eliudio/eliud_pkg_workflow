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

import 'package:eliud_pkg_workflow/model/assignment_form_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_form_state.dart';
import 'package:eliud_pkg_workflow/model/assignment_repository.dart';

class AssignmentFormBloc extends Bloc<AssignmentFormEvent, AssignmentFormState> {
  final FormAction? formAction;
  final String? appId;

  AssignmentFormBloc(this.appId, { this.formAction }): super(AssignmentFormUninitialized());
  @override
  Stream<AssignmentFormState> mapEventToState(AssignmentFormEvent event) async* {
    final currentState = state;
    if (currentState is AssignmentFormUninitialized) {
      on <InitialiseNewAssignmentFormEvent> ((event, emit) {
        AssignmentFormLoaded loaded = AssignmentFormLoaded(value: AssignmentModel(
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


      if (event is InitialiseAssignmentFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        AssignmentFormLoaded loaded = AssignmentFormLoaded(value: await assignmentRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      } else if (event is InitialiseAssignmentFormNoLoadEvent) {
        AssignmentFormLoaded loaded = AssignmentFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is AssignmentFormInitialized) {
      AssignmentModel? newValue = null;
      on <ChangedAssignmentAppId> ((event, emit) async {
        newValue = currentState.value!.copyWith(appId: event.value);
        emit(SubmittableAssignmentForm(value: newValue));

      });
      on <ChangedAssignmentReporterId> ((event, emit) async {
        newValue = currentState.value!.copyWith(reporterId: event.value);
        emit(SubmittableAssignmentForm(value: newValue));

      });
      on <ChangedAssignmentAssigneeId> ((event, emit) async {
        newValue = currentState.value!.copyWith(assigneeId: event.value);
        emit(SubmittableAssignmentForm(value: newValue));

      });
      on <ChangedAssignmentTask> ((event, emit) async {
        newValue = currentState.value!.copyWith(task: event.value);
        emit(SubmittableAssignmentForm(value: newValue));

      });
      on <ChangedAssignmentWorkflow> ((event, emit) async {
        if (event.value != null)
          newValue = currentState.value!.copyWith(workflow: await workflowRepository(appId: appId)!.get(event.value));
        emit(SubmittableAssignmentForm(value: newValue));

      });
      on <ChangedAssignmentWorkflowTaskSeqNumber> ((event, emit) async {
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(workflowTaskSeqNumber: int.parse(event.value!));
          emit(SubmittableAssignmentForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(workflowTaskSeqNumber: 0);
          emit(WorkflowTaskSeqNumberAssignmentFormError(message: "Value should be a number", value: newValue));
        }
      });
      on <ChangedAssignmentTimestamp> ((event, emit) async {
        newValue = currentState.value!.copyWith(timestamp: dateTimeFromTimestampString(event.value!));
        emit(SubmittableAssignmentForm(value: newValue));

      });
      on <ChangedAssignmentStatus> ((event, emit) async {
        newValue = currentState.value!.copyWith(status: event.value);
        emit(SubmittableAssignmentForm(value: newValue));

      });
      on <ChangedAssignmentResultsCurrent> ((event, emit) async {
        newValue = currentState.value!.copyWith(resultsCurrent: event.value);
        emit(SubmittableAssignmentForm(value: newValue));

      });
      on <ChangedAssignmentResultsPrevious> ((event, emit) async {
        newValue = currentState.value!.copyWith(resultsPrevious: event.value);
        emit(SubmittableAssignmentForm(value: newValue));

      });
      on <ChangedAssignmentTriggeredById> ((event, emit) async {
        newValue = currentState.value!.copyWith(triggeredById: event.value);
        emit(SubmittableAssignmentForm(value: newValue));

      });
      on <ChangedAssignmentConfirmMessage> ((event, emit) async {
        newValue = currentState.value!.copyWith(confirmMessage: event.value);
        emit(SubmittableAssignmentForm(value: newValue));

      });
      on <ChangedAssignmentRejectMessage> ((event, emit) async {
        newValue = currentState.value!.copyWith(rejectMessage: event.value);
        emit(SubmittableAssignmentForm(value: newValue));

      });
    }
  }


  DocumentIDAssignmentFormError error(String message, AssignmentModel newValue) => DocumentIDAssignmentFormError(message: message, value: newValue);

  Future<AssignmentFormState> _isDocumentIDValid(String? value, AssignmentModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<AssignmentModel?> findDocument = assignmentRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableAssignmentForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

