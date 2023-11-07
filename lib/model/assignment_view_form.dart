/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';

import 'package:eliud_pkg_workflow/model/assignment_view_list_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_list_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_form_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_form_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_form_state.dart';

class AssignmentViewForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final AssignmentViewModel? value;
  final ActionModel? submitAction;

  AssignmentViewForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the AssignmentViewForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<AssignmentViewFormBloc>(
        create: (context) => AssignmentViewFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseAssignmentViewFormEvent(value: value)),
        child: MyAssignmentViewForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<AssignmentViewFormBloc>(
        create: (context) => AssignmentViewFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseAssignmentViewFormNoLoadEvent(value: value)),
        child: MyAssignmentViewForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update AssignmentView'
                      : 'Add AssignmentView'),
          body: BlocProvider<AssignmentViewFormBloc>(
            create: (context) => AssignmentViewFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseAssignmentViewFormEvent(value: value)
                : InitialiseNewAssignmentViewFormEvent())),
            child: MyAssignmentViewForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class MyAssignmentViewForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyAssignmentViewForm({required this.app, this.formAction, this.submitAction});

  @override
  State<MyAssignmentViewForm> createState() =>
      _MyAssignmentViewFormState(formAction);
}

class _MyAssignmentViewFormState extends State<MyAssignmentViewForm> {
  final FormAction? formAction;
  late AssignmentViewFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  _MyAssignmentViewFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<AssignmentViewFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _titleController.addListener(_onTitleChanged);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<AssignmentViewFormBloc, AssignmentViewFormState>(
        builder: (context, state) {
      if (state is AssignmentViewFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is AssignmentViewFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _titleController.text = state.value!.title.toString();
        _descriptionController.text = state.value!.description.toString();
      }
      if (state is AssignmentViewFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DocumentIDAssignmentViewFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'title',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _titleController,
                keyboardType: TextInputType.text,
                validator: (_) => state is TitleAssignmentViewFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'description',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _descriptionController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DescriptionAssignmentViewFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Conditions')));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(accessState, state)
                    ? null
                    : () {
                        if (state is AssignmentViewFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<AssignmentViewListBloc>(context)
                                .add(UpdateAssignmentViewList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              title: state.value!.title,
                              description: state.value!.description,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<AssignmentViewListBloc>(context)
                                .add(AddAssignmentViewList(
                                    value: AssignmentViewModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              title: state.value!.title,
                              description: state.value!.description,
                              conditions: state.value!.conditions,
                            )));
                          }
                          if (widget.submitAction != null) {
                            eliudrouter.Router.navigateTo(
                                context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(
        ChangedAssignmentViewDocumentID(value: _documentIDController.text));
  }

  void _onTitleChanged() {
    _myFormBloc.add(ChangedAssignmentViewTitle(value: _titleController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc.add(
        ChangedAssignmentViewDescription(value: _descriptionController.text));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, AssignmentViewFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
