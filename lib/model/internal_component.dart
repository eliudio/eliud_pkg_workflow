/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/internal_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/tools/has_fab.dart';


import 'package:eliud_pkg_workflow/model/assignment_list_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_list.dart';
import 'package:eliud_pkg_workflow/model/assignment_dropdown_button.dart';
import 'package:eliud_pkg_workflow/model/assignment_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

import 'package:eliud_pkg_workflow/model/assignment_view_list_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_list.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_dropdown_button.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

import 'package:eliud_pkg_workflow/model/workflow_list_bloc.dart';
import 'package:eliud_pkg_workflow/model/workflow_list.dart';
import 'package:eliud_pkg_workflow/model/workflow_dropdown_button.dart';
import 'package:eliud_pkg_workflow/model/workflow_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

class ListComponentFactory implements ComponentConstructor {
  Widget createNew({String id, Map<String, Object> parameters}) {
    return ListComponent(componentId: id);
  }
}


typedef DropdownButtonChanged(String value);

class DropdownButtonComponentFactory implements ComponentDropDown {

  bool supports(String id) {

    if (id == "assignments") return true;
    if (id == "assignmentViews") return true;
    if (id == "workflows") return true;
    return false;
  }

  Widget createNew({String id, Map<String, Object> parameters, String value, DropdownButtonChanged trigger, bool optional}) {

    if (id == "assignments")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "assignmentViews")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "workflows")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    return null;
  }
}


class ListComponent extends StatelessWidget with HasFab {
  final String componentId;
  Widget widget;

  @override
  Widget fab(BuildContext context){
    if ((widget != null) && (widget is HasFab)) {
      HasFab hasFab = widget as HasFab;
      return hasFab.fab(context);
    }
    return null;
  }

  ListComponent({this.componentId}) {
    initWidget();
  }

  @override
  Widget build(BuildContext context) {

    if (componentId == 'assignments') return _assignmentBuild(context);
    if (componentId == 'assignmentViews') return _assignmentViewBuild(context);
    if (componentId == 'workflows') return _workflowBuild(context);
    return Text('Component with componentId == $componentId not found');
  }

  Widget initWidget() {
    if (componentId == 'assignments') widget = AssignmentListWidget();
    if (componentId == 'assignmentViews') widget = AssignmentViewListWidget();
    if (componentId == 'workflows') widget = WorkflowListWidget();
  }

  Widget _assignmentBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AssignmentListBloc>(
          create: (context) => AssignmentListBloc(
            BlocProvider.of<AccessBloc>(context), 
            assignmentRepository: assignmentRepository(appId: AccessBloc.appId(context)),
          )..add(LoadAssignmentList()),
        )
      ],
      child: widget,
    );
  }

  Widget _assignmentViewBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AssignmentViewListBloc>(
          create: (context) => AssignmentViewListBloc(
            BlocProvider.of<AccessBloc>(context), 
            assignmentViewRepository: assignmentViewRepository(appId: AccessBloc.appId(context)),
          )..add(LoadAssignmentViewList()),
        )
      ],
      child: widget,
    );
  }

  Widget _workflowBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WorkflowListBloc>(
          create: (context) => WorkflowListBloc(
            BlocProvider.of<AccessBloc>(context), 
            workflowRepository: workflowRepository(appId: AccessBloc.appId(context)),
          )..add(LoadWorkflowList()),
        )
      ],
      child: widget,
    );
  }

}


typedef Changed(String value);

class DropdownButtonComponent extends StatelessWidget {
  final String componentId;
  final String value;
  final Changed trigger;
  final bool optional;

  DropdownButtonComponent({this.componentId, this.value, this.trigger, this.optional});

  @override
  Widget build(BuildContext context) {

    if (componentId == 'assignments') return _assignmentBuild(context);
    if (componentId == 'assignmentViews') return _assignmentViewBuild(context);
    if (componentId == 'workflows') return _workflowBuild(context);
    return Text('Component with componentId == $componentId not found');
  }


  Widget _assignmentBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AssignmentListBloc>(
          create: (context) => AssignmentListBloc(
            BlocProvider.of<AccessBloc>(context), 
            assignmentRepository: assignmentRepository(appId: AccessBloc.appId(context)),
          )..add(LoadAssignmentList()),
        )
      ],
      child: AssignmentDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _assignmentViewBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AssignmentViewListBloc>(
          create: (context) => AssignmentViewListBloc(
            BlocProvider.of<AccessBloc>(context), 
            assignmentViewRepository: assignmentViewRepository(appId: AccessBloc.appId(context)),
          )..add(LoadAssignmentViewList()),
        )
      ],
      child: AssignmentViewDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _workflowBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WorkflowListBloc>(
          create: (context) => WorkflowListBloc(
            BlocProvider.of<AccessBloc>(context), 
            workflowRepository: workflowRepository(appId: AccessBloc.appId(context)),
          )..add(LoadWorkflowList()),
        )
      ],
      child: WorkflowDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

}


