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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';

import 'package:eliud_pkg_workflow/model/assignment_view_component_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_component_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_repository.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_component_state.dart';

abstract class AbstractAssignmentViewComponent extends StatelessWidget {
  static String componentName = "assignmentViews";
  final String assignmentViewID;

  AbstractAssignmentViewComponent({this.assignmentViewID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AssignmentViewComponentBloc> (
          create: (context) => AssignmentViewComponentBloc(
            assignmentViewRepository: getAssignmentViewRepository(context))
        ..add(FetchAssignmentViewComponent(id: assignmentViewID)),
      child: _assignmentViewBlockBuilder(context),
    );
  }

  Widget _assignmentViewBlockBuilder(BuildContext context) {
    return BlocBuilder<AssignmentViewComponentBloc, AssignmentViewComponentState>(builder: (context, state) {
      if (state is AssignmentViewComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No AssignmentView defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is AssignmentViewComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is AssignmentViewComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: DelayedCircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, AssignmentViewModel value);
  Widget alertWidget({ title: String, content: String});
  AssignmentViewRepository getAssignmentViewRepository(BuildContext context);
}

