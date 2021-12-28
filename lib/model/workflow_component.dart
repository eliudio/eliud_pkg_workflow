/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_workflow/model/workflow_component_bloc.dart';
import 'package:eliud_pkg_workflow/model/workflow_component_event.dart';
import 'package:eliud_pkg_workflow/model/workflow_model.dart';
import 'package:eliud_pkg_workflow/model/workflow_repository.dart';
import 'package:eliud_pkg_workflow/model/workflow_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractWorkflowComponent extends StatelessWidget {
  static String componentName = "workflows";
  final AppModel app;
  final String workflowId;

  AbstractWorkflowComponent({Key? key, required this.app, required this.workflowId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkflowComponentBloc> (
          create: (context) => WorkflowComponentBloc(
            workflowRepository: workflowRepository(appId: app.documentID!)!)
        ..add(FetchWorkflowComponent(id: workflowId)),
      child: _workflowBlockBuilder(context),
    );
  }

  Widget _workflowBlockBuilder(BuildContext context) {
    return BlocBuilder<WorkflowComponentBloc, WorkflowComponentState>(builder: (context, state) {
      if (state is WorkflowComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(app: app, title: "Error", content: 'No Workflow defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is WorkflowComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is WorkflowComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, WorkflowModel value);
}

