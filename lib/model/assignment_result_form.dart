/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_result_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:intl/intl.dart';

import 'package:eliud_core/eliud.dart';

import 'package:eliud_core/model/internal_component.dart';
import 'package:eliud_pkg_workflow/model/embedded_component.dart';
import 'package:eliud_pkg_workflow/tools/bespoke_formfields.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/repository_export.dart';
import 'package:eliud_pkg_workflow/model/embedded_component.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

import 'package:eliud_pkg_workflow/model/assignment_result_list_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_list_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_form_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_form_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_form_state.dart';


class AssignmentResultForm extends StatelessWidget {
  FormAction formAction;
  AssignmentResultModel? value;
  ActionModel? submitAction;

  AssignmentResultForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<AssignmentResultFormBloc >(
            create: (context) => AssignmentResultFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseAssignmentResultFormEvent(value: value)),
  
        child: MyAssignmentResultForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<AssignmentResultFormBloc >(
            create: (context) => AssignmentResultFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseAssignmentResultFormNoLoadEvent(value: value)),
  
        child: MyAssignmentResultForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update AssignmentResult' : 'Add AssignmentResult'),
        body: BlocProvider<AssignmentResultFormBloc >(
            create: (context) => AssignmentResultFormBloc(AccessBloc.appId(context),
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseAssignmentResultFormEvent(value: value) : InitialiseNewAssignmentResultFormEvent())),
  
        child: MyAssignmentResultForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyAssignmentResultForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyAssignmentResultForm({this.formAction, this.submitAction});

  _MyAssignmentResultFormState createState() => _MyAssignmentResultFormState(this.formAction);
}


class _MyAssignmentResultFormState extends State<MyAssignmentResultForm> {
  final FormAction? formAction;
  late AssignmentResultFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();


  _MyAssignmentResultFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<AssignmentResultFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _keyController.addListener(_onKeyChanged);
    _valueController.addListener(_onValueChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<AssignmentResultFormBloc, AssignmentResultFormState>(builder: (context, state) {
      if (state is AssignmentResultFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context),
      );

      if (state is AssignmentResultFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.key != null)
          _keyController.text = state.value!.key.toString();
        else
          _keyController.text = "";
        if (state.value!.value != null)
          _valueController.text = state.value!.value.toString();
        else
          _valueController.text = "";
      }
      if (state is AssignmentResultFormInitialized) {
        List<Widget> children = [];
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Key', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _keyController, keyboardType: TextInputType.text, validator: (_) => state is KeyAssignmentResultFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Value', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _valueController, keyboardType: TextInputType.text, validator: (_) => state is ValueAssignmentResultFormError ? state.message : null, hintText: null)
          );


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is AssignmentResultFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<AssignmentResultListBloc>(context).add(
                          UpdateAssignmentResultList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              key: state.value!.key, 
                              value: state.value!.value, 
                        )));
                      } else {
                        BlocProvider.of<AssignmentResultListBloc>(context).add(
                          AddAssignmentResultList(value: AssignmentResultModel(
                              documentID: state.value!.documentID, 
                              key: state.value!.key, 
                              value: state.value!.value, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  },
                ));

        return StyleRegistry.registry().styleWithContext(context).adminFormStyle().container(context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedAssignmentResultDocumentID(value: _documentIDController.text));
  }


  void _onKeyChanged() {
    _myFormBloc.add(ChangedAssignmentResultKey(value: _keyController.text));
  }


  void _onValueChanged() {
    _myFormBloc.add(ChangedAssignmentResultValue(value: _valueController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _keyController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, AssignmentResultFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



