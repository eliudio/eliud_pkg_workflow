import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_entity.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_model.dart';
import 'package:eliud_pkg_workflow/tools/bespoke_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';

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

    // Register extra workflow mapper
    ActionModelRegistry.registry().addMapper(WorkflowActionEntity.label, WorkflowActionMapper());
  }
}
