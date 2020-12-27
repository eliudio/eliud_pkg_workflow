import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_entity.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_model.dart';
import 'package:eliud_pkg_workflow/tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/tools/task/task_entity.dart';
import 'package:eliud_pkg_workflow/tools/workflow_action_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliud_router;

import 'package:eliud_pkg_workflow/model/component_registry.dart';

abstract class WorkflowPackage extends Package {
  @override
  BlocProvider createMainBloc(NavigatorBloc navigatorBloc, AccessBloc accessBloc) => null;

  @override
  Future<bool> isConditionOk(String packageCondition, AppModel app, MemberModel member, bool isOwner, int privilegeLevel) async => null;

  @override
  List<String> retrieveAllPackageConditions() => null;

  @override
  void init() {
    ComponentRegistry().init();

    // Register action handler for the workflow action
    eliud_router.Router.register(WorkflowActionHandler());

    // Register a mapper for an extra action: the mapper for the WorkflowAction
    ActionModelRegistry.registry().addMapper(WorkflowActionEntity.label, WorkflowActionMapper());

    // Register a mapper for an extra task: the mapper for the ExampleTask1
    TaskModelRegistry.registry().addMapper(ExampleTaskEntity1.label, ExampleTaskModel1Mapper());
  }
}