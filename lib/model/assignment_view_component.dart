/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_workflow/model/assignment_view_component_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_component_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core_model/model/app_model.dart';

/*
 * AbstractAssignmentViewComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractAssignmentViewComponent extends StatelessWidget {
  static String componentName = "assignmentViews";
  final AppModel app;
  final String assignmentViewId;

  /*
   * Construct AbstractAssignmentViewComponent
   */
  AbstractAssignmentViewComponent(
      {super.key, required this.app, required this.assignmentViewId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AssignmentViewComponentBloc>(
      create: (context) => AssignmentViewComponentBloc(
          assignmentViewRepository:
              assignmentViewRepository(appId: app.documentID)!)
        ..add(FetchAssignmentViewComponent(id: assignmentViewId)),
      child: _assignmentViewBlockBuilder(context),
    );
  }

  Widget _assignmentViewBlockBuilder(BuildContext context) {
    return BlocBuilder<AssignmentViewComponentBloc,
        AssignmentViewComponentState>(builder: (context, state) {
      if (state is AssignmentViewComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is AssignmentViewComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is AssignmentViewComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(app)
              .frontEndStyle()
              .progressIndicatorStyle()
              .progressIndicator(app, context),
        );
      }
    });
  }

  /*
   * Implement this method to provide your widget
   */
  Widget yourWidget(BuildContext context, AssignmentViewModel value);
}
