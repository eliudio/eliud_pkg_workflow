/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_task_form.dart
                       
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

import 'package:eliud_pkg_workflow/model/workflow_task_list_bloc.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_list_event.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_model.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_form_bloc.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_form_event.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_form_state.dart';


class WorkflowTaskForm extends StatelessWidget {
  FormAction formAction;
  WorkflowTaskModel? value;
  ActionModel? submitAction;

  WorkflowTaskForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<WorkflowTaskFormBloc >(
            create: (context) => WorkflowTaskFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseWorkflowTaskFormEvent(value: value)),
  
        child: MyWorkflowTaskForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<WorkflowTaskFormBloc >(
            create: (context) => WorkflowTaskFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseWorkflowTaskFormNoLoadEvent(value: value)),
  
        child: MyWorkflowTaskForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update WorkflowTask' : 'Add WorkflowTask'),
        body: BlocProvider<WorkflowTaskFormBloc >(
            create: (context) => WorkflowTaskFormBloc(AccessBloc.appId(context),
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseWorkflowTaskFormEvent(value: value) : InitialiseNewWorkflowTaskFormEvent())),
  
        child: MyWorkflowTaskForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyWorkflowTaskForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyWorkflowTaskForm({this.formAction, this.submitAction});

  _MyWorkflowTaskFormState createState() => _MyWorkflowTaskFormState(this.formAction);
}


class _MyWorkflowTaskFormState extends State<MyWorkflowTaskForm> {
  final FormAction? formAction;
  late WorkflowTaskFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _seqNumberController = TextEditingController();
  int? _responsibleSelectedRadioTile;


  _MyWorkflowTaskFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<WorkflowTaskFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _seqNumberController.addListener(_onSeqNumberChanged);
    _responsibleSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<WorkflowTaskFormBloc, WorkflowTaskFormState>(builder: (context, state) {
      if (state is WorkflowTaskFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context),
      );

      if (state is WorkflowTaskFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.seqNumber != null)
          _seqNumberController.text = state.value!.seqNumber.toString();
        else
          _seqNumberController.text = "";
        if (state.value!.responsible != null)
          _responsibleSelectedRadioTile = state.value!.responsible!.index;
        else
          _responsibleSelectedRadioTile = 0;
      }
      if (state is WorkflowTaskFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Sequence number', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _seqNumberController, keyboardType: TextInputType.number, validator: (_) => state is SeqNumberWorkflowTaskFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _responsibleSelectedRadioTile, 'CurrentMember', 'CurrentMember', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionResponsible(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _responsibleSelectedRadioTile, 'Owner', 'Owner', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionResponsible(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _responsibleSelectedRadioTile, 'First', 'First', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionResponsible(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _responsibleSelectedRadioTile, 'Previous', 'Previous', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionResponsible(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Task')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'WorkflowNotification')
                ));




        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is WorkflowTaskFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<WorkflowTaskListBloc>(context).add(
                          UpdateWorkflowTaskList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              seqNumber: state.value!.seqNumber, 
                              task: state.value!.task, 
                              confirmMessage: state.value!.confirmMessage, 
                              rejectMessage: state.value!.rejectMessage, 
                              responsible: state.value!.responsible, 
                        )));
                      } else {
                        BlocProvider.of<WorkflowTaskListBloc>(context).add(
                          AddWorkflowTaskList(value: WorkflowTaskModel(
                              documentID: state.value!.documentID, 
                              seqNumber: state.value!.seqNumber, 
                              task: state.value!.task, 
                              confirmMessage: state.value!.confirmMessage, 
                              rejectMessage: state.value!.rejectMessage, 
                              responsible: state.value!.responsible, 
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
    _myFormBloc.add(ChangedWorkflowTaskDocumentID(value: _documentIDController.text));
  }


  void _onSeqNumberChanged() {
    _myFormBloc.add(ChangedWorkflowTaskSeqNumber(value: _seqNumberController.text));
  }


  void setSelectionResponsible(int? val) {
    setState(() {
      _responsibleSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedWorkflowTaskResponsible(value: toWorkflowTaskResponsible(val)));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _seqNumberController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, WorkflowTaskFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



