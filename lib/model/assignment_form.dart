/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
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

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/repository_export.dart';
import 'package:eliud_core/model/embedded_component.dart';
import 'package:eliud_pkg_workflow/model/embedded_component.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

import 'package:eliud_pkg_workflow/model/assignment_list_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_list_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_form_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_form_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_form_state.dart';


class AssignmentForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  AssignmentModel? value;
  ActionModel? submitAction;

  AssignmentForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID!;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<AssignmentFormBloc >(
            create: (context) => AssignmentFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseAssignmentFormEvent(value: value)),
  
        child: MyAssignmentForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<AssignmentFormBloc >(
            create: (context) => AssignmentFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseAssignmentFormNoLoadEvent(value: value)),
  
        child: MyAssignmentForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update Assignment' : 'Add Assignment'),
        body: BlocProvider<AssignmentFormBloc >(
            create: (context) => AssignmentFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseAssignmentFormEvent(value: value) : InitialiseNewAssignmentFormEvent())),
  
        child: MyAssignmentForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyAssignmentForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyAssignmentForm({required this.app, this.formAction, this.submitAction});

  _MyAssignmentFormState createState() => _MyAssignmentFormState(this.formAction);
}


class _MyAssignmentFormState extends State<MyAssignmentForm> {
  final FormAction? formAction;
  late AssignmentFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _reporterIdController = TextEditingController();
  final TextEditingController _assigneeIdController = TextEditingController();
  String? _workflow;
  final TextEditingController _workflowTaskSeqNumberController = TextEditingController();
  int? _statusSelectedRadioTile;
  final TextEditingController _triggeredByIdController = TextEditingController();


  _MyAssignmentFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<AssignmentFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _reporterIdController.addListener(_onReporterIdChanged);
    _assigneeIdController.addListener(_onAssigneeIdChanged);
    _workflowTaskSeqNumberController.addListener(_onWorkflowTaskSeqNumberChanged);
    _statusSelectedRadioTile = 0;
    _triggeredByIdController.addListener(_onTriggeredByIdChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<AssignmentFormBloc, AssignmentFormState>(builder: (context, state) {
      if (state is AssignmentFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is AssignmentFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.reporterId != null)
          _reporterIdController.text = state.value!.reporterId.toString();
        else
          _reporterIdController.text = "";
        if (state.value!.assigneeId != null)
          _assigneeIdController.text = state.value!.assigneeId.toString();
        else
          _assigneeIdController.text = "";
        if (state.value!.workflow != null)
          _workflow= state.value!.workflow!.documentID;
        else
          _workflow= "";
        if (state.value!.workflowTaskSeqNumber != null)
          _workflowTaskSeqNumberController.text = state.value!.workflowTaskSeqNumber.toString();
        else
          _workflowTaskSeqNumberController.text = "";
        if (state.value!.status != null)
          _statusSelectedRadioTile = state.value!.status!.index;
        else
          _statusSelectedRadioTile = 0;
        if (state.value!.triggeredById != null)
          _triggeredByIdController.text = state.value!.triggeredById.toString();
        else
          _triggeredByIdController.text = "";
      }
      if (state is AssignmentFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'App Identifier', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _appIdController, keyboardType: TextInputType.text, validator: (_) => state is AppIdAssignmentFormError ? state.message : null, hintText: 'field.remark')
          );


        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Workflow Sequence Id', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _workflowTaskSeqNumberController, keyboardType: TextInputType.number, validator: (_) => state is WorkflowTaskSeqNumberAssignmentFormError ? state.message : null, hintText: 'field.remark')
          );


        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _statusSelectedRadioTile, 'Success', 'Success', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionStatus(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _statusSelectedRadioTile, 'Declined', 'Declined', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionStatus(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _statusSelectedRadioTile, 'Open', 'Open', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionStatus(val))
          );

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: assignmentResultsList(widget.app, context, state.value!.resultsCurrent, _onResultsCurrentChanged)
                )
          );

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: assignmentResultsList(widget.app, context, state.value!.resultsPrevious, _onResultsPreviousChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Reporter')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Reporter', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _reporterIdController, keyboardType: TextInputType.text, validator: (_) => state is ReporterIdAssignmentFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Assignee')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Assignee', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _assigneeIdController, keyboardType: TextInputType.text, validator: (_) => state is AssigneeIdAssignmentFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Triggered by')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Triggered by', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _triggeredByIdController, keyboardType: TextInputType.text, validator: (_) => state is TriggeredByIdAssignmentFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Workflow')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "workflows", value: _workflow, trigger: (value, privilegeLevel) => _onWorkflowSelected(value), optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Assignee')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Assignee', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _assigneeIdController, keyboardType: TextInputType.text, validator: (_) => state is AssigneeIdAssignmentFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'WorkflowNotification')
                ));




        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is AssignmentFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<AssignmentListBloc>(context).add(
                          UpdateAssignmentList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              reporterId: state.value!.reporterId, 
                              assigneeId: state.value!.assigneeId, 
                              task: state.value!.task, 
                              workflow: state.value!.workflow, 
                              workflowTaskSeqNumber: state.value!.workflowTaskSeqNumber, 
                              timestamp: state.value!.timestamp, 
                              status: state.value!.status, 
                              resultsCurrent: state.value!.resultsCurrent, 
                              resultsPrevious: state.value!.resultsPrevious, 
                              triggeredById: state.value!.triggeredById, 
                              confirmMessage: state.value!.confirmMessage, 
                              rejectMessage: state.value!.rejectMessage, 
                        )));
                      } else {
                        BlocProvider.of<AssignmentListBloc>(context).add(
                          AddAssignmentList(value: AssignmentModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              reporterId: state.value!.reporterId, 
                              assigneeId: state.value!.assigneeId, 
                              task: state.value!.task, 
                              workflow: state.value!.workflow, 
                              workflowTaskSeqNumber: state.value!.workflowTaskSeqNumber, 
                              timestamp: state.value!.timestamp, 
                              status: state.value!.status, 
                              resultsCurrent: state.value!.resultsCurrent, 
                              resultsPrevious: state.value!.resultsPrevious, 
                              triggeredById: state.value!.triggeredById, 
                              confirmMessage: state.value!.confirmMessage, 
                              rejectMessage: state.value!.rejectMessage, 
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

        return StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().container(widget.app, context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedAssignmentDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedAssignmentAppId(value: _appIdController.text));
  }


  void _onReporterIdChanged() {
    _myFormBloc.add(ChangedAssignmentReporterId(value: _reporterIdController.text));
  }


  void _onAssigneeIdChanged() {
    _myFormBloc.add(ChangedAssignmentAssigneeId(value: _assigneeIdController.text));
  }


  void _onWorkflowSelected(String? val) {
    setState(() {
      _workflow = val;
    });
    _myFormBloc.add(ChangedAssignmentWorkflow(value: val));
  }


  void _onWorkflowTaskSeqNumberChanged() {
    _myFormBloc.add(ChangedAssignmentWorkflowTaskSeqNumber(value: _workflowTaskSeqNumberController.text));
  }


  void setSelectionStatus(int? val) {
    setState(() {
      _statusSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedAssignmentStatus(value: toAssignmentStatus(val)));
  }


  void _onResultsCurrentChanged(value) {
    _myFormBloc.add(ChangedAssignmentResultsCurrent(value: value));
    setState(() {});
  }


  void _onResultsPreviousChanged(value) {
    _myFormBloc.add(ChangedAssignmentResultsPrevious(value: value));
    setState(() {});
  }


  void _onTriggeredByIdChanged() {
    _myFormBloc.add(ChangedAssignmentTriggeredById(value: _triggeredByIdController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _reporterIdController.dispose();
    _assigneeIdController.dispose();
    _workflowTaskSeqNumberController.dispose();
    _triggeredByIdController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, AssignmentFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID!));
  }
  

}



