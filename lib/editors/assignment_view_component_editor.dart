import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_event.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_state.dart';

import 'bloc/assignment_bloc.dart';

class AssignmentViewComponentEditorConstructor
    extends ComponentEditorConstructor {
  @override
  void updateComponent(
      AppModel app, BuildContext context, model, EditorFeedback feedback) {
    _openIt(app, context, false, model.copyWith(), feedback);
  }

  @override
  void createNewComponent(
      AppModel app, BuildContext context, EditorFeedback feedback) {
    _openIt(
        app,
        context,
        true,
        AssignmentViewModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          description: 'Assignment View',
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var assignmentView =
    await assignmentViewRepository(appId: app.documentID)!.get(id);
    if (assignmentView != null) {
      _openIt(app, context, false, assignmentView, feedback);
    } else {
      openErrorDialog(app, context, app.documentID + '/_error',
          title: 'Error',
          errorMessage: 'Cannot find notification dashboard with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      AssignmentViewModel model, EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      app.documentID + '/notificationdashboard',
      title: create
          ? 'Create Notification Dashboard'
          : 'Update Notification Dashboard',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<AssignmentViewBloc>(
          create: (context) => AssignmentViewBloc(
            app.documentID,
            /*create,
            */
            feedback,
          )..add(EditorBaseInitialise<AssignmentViewModel>(model)),
          child: AssignmentViewComponentEditor(
            app: app,
          )),
    );
  }
}

class AssignmentViewComponentEditor extends StatefulWidget {
  final AppModel app;

  const AssignmentViewComponentEditor({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _AssignmentViewComponentEditorState();
}

class _AssignmentViewComponentEditorState
    extends State<AssignmentViewComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
          if (accessState is AccessDetermined) {
            return BlocBuilder<AssignmentViewBloc, EditorBaseState<AssignmentViewModel>>(
                builder: (ppContext, assignmentViewState) {
                  if (assignmentViewState is EditorBaseInitialised<AssignmentViewModel>) {
                    return ListView(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        children: [
                          HeaderWidget(
                            app: widget.app,
                            title: 'AssignmentView',
                            okAction: () async {
                              await BlocProvider.of<AssignmentViewBloc>(context)
                                  .save(EditorBaseApplyChanges<AssignmentViewModel>(
                                  model: assignmentViewState.model));
                              return true;
                            },
                            cancelAction: () async {
                              return true;
                            },
                          ),
                          topicContainer(widget.app, context,
                              title: 'General',
                              collapsible: true,
                              collapsed: true,
                              children: [
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.vpn_key),
                                    title: text(widget.app, context,
                                        assignmentViewState.model.documentID)),
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.description),
                                    title: dialogField(
                                      widget.app,
                                      context,
                                      initialValue: assignmentViewState.model.description,
                                      valueChanged: (value) {
                                        assignmentViewState.model.description = value;
                                      },
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        hintText: 'Description',
                                        labelText: 'Description',
                                      ),
                                    )),
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.description),
                                    title: dialogField(
                                      widget.app,
                                      context,
                                      initialValue: assignmentViewState.model.title,
                                      valueChanged: (value) {
                                        assignmentViewState.model.title = value;
                                      },
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        hintText: 'Title',
                                        labelText: 'Title',
                                      ),
                                    )),
                              ]),
                          topicContainer(widget.app, context,
                              title: 'Condition',
                              collapsible: true,
                              collapsed: true,
                              children: [
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.security),
                                    title: ConditionsSimpleWidget(
                                      app: widget.app,
                                      value: assignmentViewState.model.conditions!,
                                    )),
                              ]),
                        ]);
                  } else {
                    return progressIndicator(widget.app, context);
                  }
                });
          } else {
            return progressIndicator(widget.app, context);
          }
        });
  }

}
