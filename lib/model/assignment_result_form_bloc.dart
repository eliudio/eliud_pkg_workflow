/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_result_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:bloc/bloc.dart';




import 'package:eliud_pkg_workflow/model/model_export.dart';

import 'package:eliud_pkg_workflow/model/assignment_result_form_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_form_state.dart';

class AssignmentResultFormBloc extends Bloc<AssignmentResultFormEvent, AssignmentResultFormState> {
  final String? appId;

  AssignmentResultFormBloc(this.appId, ): super(AssignmentResultFormUninitialized()) {
      on <InitialiseNewAssignmentResultFormEvent> ((event, emit) {
        AssignmentResultFormLoaded loaded = AssignmentResultFormLoaded(value: AssignmentResultModel(
                                               documentID: "IDENTIFIER", 
                                 key: "",
                                 value: "",

        ));
        emit(loaded);
      });


      on <InitialiseAssignmentResultFormEvent> ((event, emit) async {
        AssignmentResultFormLoaded loaded = AssignmentResultFormLoaded(value: event.value);
        emit(loaded);
      });
      on <InitialiseAssignmentResultFormNoLoadEvent> ((event, emit) async {
        AssignmentResultFormLoaded loaded = AssignmentResultFormLoaded(value: event.value);
        emit(loaded);
      });
      AssignmentResultModel? newValue;
      on <ChangedAssignmentResultKey> ((event, emit) async {
      if (state is AssignmentResultFormInitialized) {
        final currentState = state as AssignmentResultFormInitialized;
        newValue = currentState.value!.copyWith(key: event.value);
        emit(SubmittableAssignmentResultForm(value: newValue));

      }
      });
      on <ChangedAssignmentResultValue> ((event, emit) async {
      if (state is AssignmentResultFormInitialized) {
        final currentState = state as AssignmentResultFormInitialized;
        newValue = currentState.value!.copyWith(value: event.value);
        emit(SubmittableAssignmentResultForm(value: newValue));

      }
      });
  }


}

