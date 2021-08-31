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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_pkg_workflow/model/workflow_component_bloc.dart';
import 'package:eliud_pkg_workflow/model/workflow_component_event.dart';
import 'package:eliud_pkg_workflow/model/workflow_model.dart';
import 'package:eliud_pkg_workflow/model/workflow_repository.dart';
import 'package:eliud_pkg_workflow/model/workflow_component_state.dart';

abstract class AbstractWorkflowComponent extends StatelessWidget {
  static String componentName = "workflows";
  final String? workflowID;

  AbstractWorkflowComponent({Key? key, this.workflowID}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkflowComponentBloc> (
          create: (context) => WorkflowComponentBloc(
            workflowRepository: getWorkflowRepository(context))
        ..add(FetchWorkflowComponent(id: workflowID)),
      child: _workflowBlockBuilder(context),
    );
  }

  Widget _workflowBlockBuilder(BuildContext context) {
    return BlocBuilder<WorkflowComponentBloc, WorkflowComponentState>(builder: (context, state) {
      if (state is WorkflowComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No Workflow defined');
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
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, WorkflowModel? value);
  Widget alertWidget({ title: String, content: String});
  WorkflowRepository getWorkflowRepository(BuildContext context);
}

