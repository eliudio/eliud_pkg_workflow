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

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_pkg_workflow/model/model_export.dart';

import 'package:eliud_pkg_workflow/model/assignment_result_list_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_list_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_form_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_form_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_form_state.dart';

class AssignmentResultForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final AssignmentResultModel? value;
  final ActionModel? submitAction;

  AssignmentResultForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the AssignmentResultForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<AssignmentResultFormBloc>(
        create: (context) => AssignmentResultFormBloc(
          appId,
        )..add(InitialiseAssignmentResultFormEvent(value: value)),
        child: MyAssignmentResultForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<AssignmentResultFormBloc>(
        create: (context) => AssignmentResultFormBloc(
          appId,
        )..add(InitialiseAssignmentResultFormNoLoadEvent(value: value)),
        child: MyAssignmentResultForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update AssignmentResult'
                      : 'Add AssignmentResult'),
          body: BlocProvider<AssignmentResultFormBloc>(
            create: (context) => AssignmentResultFormBloc(
              appId,
            )..add((formAction == FormAction.updateAction
                ? InitialiseAssignmentResultFormEvent(value: value)
                : InitialiseNewAssignmentResultFormEvent())),
            child: MyAssignmentResultForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class MyAssignmentResultForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyAssignmentResultForm(
      {required this.app, this.formAction, this.submitAction});

  @override
  State<MyAssignmentResultForm> createState() =>
      _MyAssignmentResultFormState(formAction);
}

class _MyAssignmentResultFormState extends State<MyAssignmentResultForm> {
  final FormAction? formAction;
  late AssignmentResultFormBloc _myFormBloc;

  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  _MyAssignmentResultFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<AssignmentResultFormBloc>(context);
    _keyController.addListener(_onKeyChanged);
    _valueController.addListener(_onValueChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<AssignmentResultFormBloc, AssignmentResultFormState>(
        builder: (context, state) {
      if (state is AssignmentResultFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is AssignmentResultFormLoaded) {
        _keyController.text = state.value!.key.toString();
        _valueController.text = state.value!.value.toString();
      }
      if (state is AssignmentResultFormInitialized) {
        List<Widget> children = [];
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Key',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _keyController,
                keyboardType: TextInputType.text,
                validator: (_) => state is KeyAssignmentResultFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Value',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _valueController,
                keyboardType: TextInputType.text,
                validator: (_) => state is ValueAssignmentResultFormError
                    ? state.message
                    : null,
                hintText: null));

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
                        if (state is AssignmentResultFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<AssignmentResultListBloc>(context)
                                .add(UpdateAssignmentResultList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              key: state.value!.key,
                              value: state.value!.value,
                            )));
                          } else {
                            BlocProvider.of<AssignmentResultListBloc>(context)
                                .add(AddAssignmentResultList(
                                    value: AssignmentResultModel(
                              documentID: state.value!.documentID,
                              key: state.value!.key,
                              value: state.value!.value,
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

  void _onKeyChanged() {
    _myFormBloc.add(ChangedAssignmentResultKey(value: _keyController.text));
  }

  void _onValueChanged() {
    _myFormBloc.add(ChangedAssignmentResultValue(value: _valueController.text));
  }

  @override
  void dispose() {
    _keyController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(
      AccessState accessState, AssignmentResultFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
