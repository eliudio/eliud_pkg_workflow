/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_form_bloc.dart
                       
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

import 'package:eliud_pkg_workflow/model/assignment_view_form_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_form_state.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_repository.dart';

class AssignmentViewFormBloc extends Bloc<AssignmentViewFormEvent, AssignmentViewFormState> {
  final FormAction? formAction;
  final String? appId;

  AssignmentViewFormBloc(this.appId, { this.formAction }): super(AssignmentViewFormUninitialized());
  @override
  Stream<AssignmentViewFormState> mapEventToState(AssignmentViewFormEvent event) async* {
    final currentState = state;
    if (currentState is AssignmentViewFormUninitialized) {
      if (event is InitialiseNewAssignmentViewFormEvent) {
        AssignmentViewFormLoaded loaded = AssignmentViewFormLoaded(value: AssignmentViewModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",
                                 description: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseAssignmentViewFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        AssignmentViewFormLoaded loaded = AssignmentViewFormLoaded(value: await assignmentViewRepository(appId: appId)!.get(event!.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseAssignmentViewFormNoLoadEvent) {
        AssignmentViewFormLoaded loaded = AssignmentViewFormLoaded(value: event!.value);
        yield loaded;
        return;
      }
    } else if (currentState is AssignmentViewFormInitialized) {
      AssignmentViewModel? newValue = null;
      if (event is ChangedAssignmentViewDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event!.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event!.value, newValue).asStream();
        } else {
          yield SubmittableAssignmentViewForm(value: newValue);
        }

        return;
      }
      if (event is ChangedAssignmentViewTitle) {
        newValue = currentState.value!.copyWith(title: event!.value);
        yield SubmittableAssignmentViewForm(value: newValue);

        return;
      }
      if (event is ChangedAssignmentViewDescription) {
        newValue = currentState.value!.copyWith(description: event!.value);
        yield SubmittableAssignmentViewForm(value: newValue);

        return;
      }
      if (event is ChangedAssignmentViewConditions) {
        newValue = currentState.value!.copyWith(conditions: event!.value);
        yield SubmittableAssignmentViewForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDAssignmentViewFormError error(String message, AssignmentViewModel newValue) => DocumentIDAssignmentViewFormError(message: message, value: newValue);

  Future<AssignmentViewFormState> _isDocumentIDValid(String? value, AssignmentViewModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<AssignmentViewModel?> findDocument = assignmentViewRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableAssignmentViewForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

