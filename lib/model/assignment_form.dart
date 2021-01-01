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

import 'package:eliud_core/core/widgets/progress_indicator.dart';
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
  FormAction formAction;
  AssignmentModel value;
  ActionModel submitAction;

  AssignmentForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (formAction == FormAction.ShowData) {
      return BlocProvider<AssignmentFormBloc >(
            create: (context) => AssignmentFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseAssignmentFormEvent(value: value)),
  
        child: MyAssignmentForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<AssignmentFormBloc >(
            create: (context) => AssignmentFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseAssignmentFormNoLoadEvent(value: value)),
  
        child: MyAssignmentForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update Assignment", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add Assignment", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                ),
        body: BlocProvider<AssignmentFormBloc >(
            create: (context) => AssignmentFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseAssignmentFormEvent(value: value) : InitialiseNewAssignmentFormEvent())),
  
        child: MyAssignmentForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyAssignmentForm extends StatefulWidget {
  final FormAction formAction;
  final ActionModel submitAction;

  MyAssignmentForm({this.formAction, this.submitAction});

  _MyAssignmentFormState createState() => _MyAssignmentFormState(this.formAction);
}


class _MyAssignmentFormState extends State<MyAssignmentForm> {
  final FormAction formAction;
  AssignmentFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  String _reporter;
  final TextEditingController _assigneeIdController = TextEditingController();
  String _workflow;
  final TextEditingController _workflowTaskSeqNumberController = TextEditingController();
  int _statusSelectedRadioTile;
  final TextEditingController _triggeredByIdController = TextEditingController();


  _MyAssignmentFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<AssignmentFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _assigneeIdController.addListener(_onAssigneeIdChanged);
    _workflowTaskSeqNumberController.addListener(_onWorkflowTaskSeqNumberChanged);
    _statusSelectedRadioTile = 0;
    _triggeredByIdController.addListener(_onTriggeredByIdChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<AssignmentFormBloc, AssignmentFormState>(builder: (context, state) {
      if (state is AssignmentFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is AssignmentFormLoaded) {
        if (state.value.documentID != null)
          _documentIDController.text = state.value.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value.appId != null)
          _appIdController.text = state.value.appId.toString();
        else
          _appIdController.text = "";
        if (state.value.reporter != null)
          _reporter= state.value.reporter.documentID;
        else
          _reporter= "";
        if (state.value.assigneeId != null)
          _assigneeIdController.text = state.value.assigneeId.toString();
        else
          _assigneeIdController.text = "";
        if (state.value.workflow != null)
          _workflow= state.value.workflow.documentID;
        else
          _workflow= "";
        if (state.value.workflowTaskSeqNumber != null)
          _workflowTaskSeqNumberController.text = state.value.workflowTaskSeqNumber.toString();
        else
          _workflowTaskSeqNumberController.text = "";
        if (state.value.status != null)
          _statusSelectedRadioTile = state.value.status.index;
        else
          _statusSelectedRadioTile = 0;
        if (state.value.triggeredById != null)
          _triggeredByIdController.text = state.value.triggeredById.toString();
        else
          _triggeredByIdController.text = "";
      }
      if (state is AssignmentFormInitialized) {
        List<Widget> children = List();
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _appIdController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'App Identifier',
                    hintText: "This is the identifier of the app to which this feed belongs",
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is AppIdAssignmentFormError ? state.message : null;
                  },
                ),
          );


        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _workflowTaskSeqNumberController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Workflow Sequence Id',
                    hintText: "this corresponds to the WorkflowModel.workflowTask[i].seqNumber",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is WorkflowTaskSeqNumberAssignmentFormError ? state.message : null;
                  },
                ),
          );


        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _statusSelectedRadioTile,
                    title: Text("Success", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Success", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionStatus(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _statusSelectedRadioTile,
                    title: Text("Declined", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Declined", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionStatus(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _statusSelectedRadioTile,
                    title: Text("Open", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Open", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionStatus(val);
                    },
                ),
          );

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: assignmentResultsList(context, state.value.resultsCurrent, _onResultsCurrentChanged)
                )
          );

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: assignmentResultsList(context, state.value.resultsPrevious, _onResultsPreviousChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Reporter',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "members", value: _reporter, trigger: _onReporterSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Assignee',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _assigneeIdController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Assignee',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is AssigneeIdAssignmentFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Reporter',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "members", value: _reporter, trigger: _onReporterSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Triggered by',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _triggeredByIdController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Triggered by',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is TriggeredByIdAssignmentFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Workflow',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "workflows", value: _workflow, trigger: _onWorkflowSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Assignee',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _assigneeIdController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Assignee',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is AssigneeIdAssignmentFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is AssignmentFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<AssignmentListBloc>(context).add(
                          UpdateAssignmentList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              reporter: state.value.reporter, 
                              assigneeId: state.value.assigneeId, 
                              task: state.value.task, 
                              workflow: state.value.workflow, 
                              workflowTaskSeqNumber: state.value.workflowTaskSeqNumber, 
                              timestamp: state.value.timestamp, 
                              status: state.value.status, 
                              resultsCurrent: state.value.resultsCurrent, 
                              resultsPrevious: state.value.resultsPrevious, 
                              triggeredById: state.value.triggeredById, 
                        )));
                      } else {
                        BlocProvider.of<AssignmentListBloc>(context).add(
                          AddAssignmentList(value: AssignmentModel(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              reporter: state.value.reporter, 
                              assigneeId: state.value.assigneeId, 
                              task: state.value.task, 
                              workflow: state.value.workflow, 
                              workflowTaskSeqNumber: state.value.workflowTaskSeqNumber, 
                              timestamp: state.value.timestamp, 
                              status: state.value.status, 
                              resultsCurrent: state.value.resultsCurrent, 
                              resultsPrevious: state.value.resultsPrevious, 
                              triggeredById: state.value.triggeredById, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction);
                      } else {
                        Navigator.pop(context);
                      }
                      return true;
                    }
                  },
                  child: Text('Submit', style: TextStyle(color: RgbHelper.color(rgbo: app.formSubmitButtonTextColor))),
                ));

        return Container(
          color: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? Colors.transparent : null,
          decoration: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? null : BoxDecorationHelper.boxDecoration(accessState, app.formBackground),
          padding:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children
            ),
          )
        );
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedAssignmentDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedAssignmentAppId(value: _appIdController.text));
  }


  void _onReporterSelected(String val) {
    setState(() {
      _reporter = val;
    });
    _myFormBloc.add(ChangedAssignmentReporter(value: val));
  }


  void _onAssigneeIdChanged() {
    _myFormBloc.add(ChangedAssignmentAssigneeId(value: _assigneeIdController.text));
  }


  void _onWorkflowSelected(String val) {
    setState(() {
      _workflow = val;
    });
    _myFormBloc.add(ChangedAssignmentWorkflow(value: val));
  }


  void _onWorkflowTaskSeqNumberChanged() {
    _myFormBloc.add(ChangedAssignmentWorkflowTaskSeqNumber(value: _workflowTaskSeqNumberController.text));
  }


  void setSelectionStatus(int val) {
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
    _assigneeIdController.dispose();
    _workflowTaskSeqNumberController.dispose();
    _triggeredByIdController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, AssignmentFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



