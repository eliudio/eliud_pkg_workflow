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

import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/tools/query/query_tools.dart';

import 'package:eliud_core/tools/has_fab.dart';

import 'package:eliud_pkg_workflow/model/assignment_list_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_list.dart';
import 'package:eliud_pkg_workflow/model/assignment_dropdown_button.dart';
import 'package:eliud_pkg_workflow/model/assignment_list_event.dart';

import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_pkg_workflow/model/assignment_view_list_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_list.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_dropdown_button.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_list_event.dart';

import 'package:eliud_pkg_workflow/model/workflow_list_bloc.dart';
import 'package:eliud_pkg_workflow/model/workflow_list.dart';
import 'package:eliud_pkg_workflow/model/workflow_dropdown_button.dart';
import 'package:eliud_pkg_workflow/model/workflow_list_event.dart';

class ListComponentFactory implements ComponentConstructor {
  @override
  Widget? createNew(
      {Key? key,
      required AppModel app,
      required String id,
      int? privilegeLevel,
      Map<String, dynamic>? parameters}) {
    return ListComponent(app: app, componentId: id);
  }

  @override
  dynamic getModel({required AppModel app, required String id}) {
    return null;
  }
}

typedef DropdownButtonChanged = Function(String? value, int? privilegeLevel);

class DropdownButtonComponentFactory implements ComponentDropDown {
  @override
  dynamic getModel({required AppModel app, required String id}) {
    return null;
  }

  @override
  bool supports(String id) {
    if (id == "assignments") return true;
    if (id == "assignmentViews") return true;
    if (id == "workflows") return true;
    return false;
  }

  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      int? privilegeLevel,
      Map<String, dynamic>? parameters,
      String? value,
      DropdownButtonChanged? trigger,
      bool? optional}) {
    if (id == "assignments") {
      return DropdownButtonComponent(
          app: app,
          componentId: id,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional);
    }

    if (id == "assignmentViews") {
      return DropdownButtonComponent(
          app: app,
          componentId: id,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional);
    }

    if (id == "workflows") {
      return DropdownButtonComponent(
          app: app,
          componentId: id,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional);
    }

    return Text("Id $id not found");
  }
}

class ListComponent extends StatelessWidget with HasFab {
  final AppModel app;
  final String? componentId;
  final Widget? widget;
  final int? privilegeLevel;

  @override
  Widget? fab(BuildContext context) {
    if ((widget != null) && (widget is HasFab)) {
      HasFab hasFab = widget as HasFab;
      return hasFab.fab(context);
    }
    return null;
  }

  ListComponent({required this.app, this.privilegeLevel, this.componentId})
      : widget = getWidget(componentId, app);

  @override
  Widget build(BuildContext context) {
    if (componentId == 'assignments') {
      return _assignmentBuild(context);
    }
    if (componentId == 'assignmentViews') {
      return _assignmentViewBuild(context);
    }
    if (componentId == 'workflows') {
      return _workflowBuild(context);
    }
    return Text('Component with componentId == $componentId not found');
  }

  static Widget getWidget(String? componentId, AppModel app) {
    if (componentId == 'assignments') {
      return AssignmentListWidget(app: app);
    }
    if (componentId == 'assignmentViews') {
      return AssignmentViewListWidget(app: app);
    }
    if (componentId == 'workflows') {
      return WorkflowListWidget(app: app);
    }
    return Container();
  }

  Widget _assignmentBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AssignmentListBloc>(
          create: (context) => AssignmentListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            assignmentRepository: assignmentRepository(appId: app.documentID)!,
          )..add(LoadAssignmentList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _assignmentViewBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AssignmentViewListBloc>(
          create: (context) => AssignmentViewListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            assignmentViewRepository:
                assignmentViewRepository(appId: app.documentID)!,
          )..add(LoadAssignmentViewList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _workflowBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WorkflowListBloc>(
          create: (context) => WorkflowListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            workflowRepository: workflowRepository(appId: app.documentID)!,
          )..add(LoadWorkflowList()),
        )
      ],
      child: widget!,
    );
  }
}

typedef Changed = Function(String? value, int? privilegeLevel);

class DropdownButtonComponent extends StatelessWidget {
  final AppModel app;
  final String? componentId;
  final String? value;
  final Changed? trigger;
  final bool? optional;
  final int? privilegeLevel;

  DropdownButtonComponent(
      {required this.app,
      this.componentId,
      this.privilegeLevel,
      this.value,
      this.trigger,
      this.optional});

  @override
  Widget build(BuildContext context) {
    if (componentId == 'assignments') {
      return _assignmentBuild(context);
    }
    if (componentId == 'assignmentViews') {
      return _assignmentViewBuild(context);
    }
    if (componentId == 'workflows') {
      return _workflowBuild(context);
    }
    return Text('Component with componentId == $componentId not found');
  }

  Widget _assignmentBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AssignmentListBloc>(
          create: (context) => AssignmentListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            assignmentRepository: assignmentRepository(appId: app.documentID)!,
          )..add(LoadAssignmentList()),
        )
      ],
      child: AssignmentDropdownButtonWidget(
          app: app,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional),
    );
  }

  Widget _assignmentViewBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AssignmentViewListBloc>(
          create: (context) => AssignmentViewListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            assignmentViewRepository:
                assignmentViewRepository(appId: app.documentID)!,
          )..add(LoadAssignmentViewList()),
        )
      ],
      child: AssignmentViewDropdownButtonWidget(
          app: app,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional),
    );
  }

  Widget _workflowBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WorkflowListBloc>(
          create: (context) => WorkflowListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            workflowRepository: workflowRepository(appId: app.documentID)!,
          )..add(LoadWorkflowList()),
        )
      ],
      child: WorkflowDropdownButtonWidget(
          app: app,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional),
    );
  }
}
