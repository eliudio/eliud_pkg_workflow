import 'dart:async';

import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_entity.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_model.dart';
import 'package:eliud_pkg_workflow/tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/tools/task/task_entity.dart';
import 'package:eliud_pkg_workflow/tools/workflow_action_handler.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliud_router;

import 'package:eliud_pkg_workflow/model/component_registry.dart';

// Todo: clearly we can introduce some caching, as we are listening as well as querying the same data. So, instead: keep a cache and update the cache adnd use it from within the isConditionOk
abstract class WorkflowPackage extends Package {
  static final String CONDITION_MUST_HAVE_ASSIGNMENTS = 'MustHaveAssignments';
  AccessBloc accessBloc;
  StreamSubscription _assignmentsSubscription;
  bool previousState = null;

  @override
  BlocProvider createMainBloc(NavigatorBloc navigatorBloc, AccessBloc accessBloc) {
    // store the accessBloc
    this.accessBloc = accessBloc;

    // register an extra access bloc event mapper, pointing our mapAccessEvent method
    //  accessBloc.addMapper(mapAccessEvent);
    accessBloc.addStateChangeListener(mapAccessState);
  }

  void mapAccessState(AccessEvent event, AccessState state) {
    // state is the state after it was handled by AccessBloc
    if (state is AppLoaded) {
      if (event is InitApp) {
        _listenForAssignmentChanges(state.app, state.getMember());
      } else if (event is SwitchAppEvent) {
        _listenForAssignmentChanges(state.app, state.getMember());
      } else if (event is LogoutEvent) {
        _assignmentsSubscription?.cancel();
      } else if (event is LoginEvent) {
        _listenForAssignmentChanges(state.app, state.getMember());
      }
    }
  }

  EliudQuery getAssignmentQuery(String appId, String assigneeId) {
    return EliudQuery(
        theConditions: [
          EliudQueryCondition('assigneeId', isEqualTo: assigneeId),
          EliudQueryCondition('appId', isEqualTo: appId),
//          EliudQueryCondition('closed', isEqualTo: true)
        ]
    );
  }

  void _listenForAssignmentChanges(AppModel app, MemberModel currentMember) {
    if (currentMember == null) return;
    String appId = app.documentID;
    _assignmentsSubscription?.cancel();
    _assignmentsSubscription = assignmentRepository(appId: appId).listen((list) {
      // If we have a different set of assignments, i.e. it has assignments were before it didn't or vice versa,
      // then we must inform the AccessBloc, so that it can refresh the state
      bool currentState = list.length > 0;
      if (currentState != previousState) {
        previousState = currentState;
        accessBloc.add(MemberUpdated(currentMember));
      }
    }, orderBy: 'timestamp', descending: true, eliudQuery: getAssignmentQuery(appId, currentMember.documentID));
  }

  @override
  Future<bool> isConditionOk(String packageCondition, AppModel app, MemberModel member, bool isOwner, int privilegeLevel) async {
    if (packageCondition == CONDITION_MUST_HAVE_ASSIGNMENTS) {
      if (member == null) return false;
      var values = await assignmentRepository(appId: app.documentID).valuesList(eliudQuery: getAssignmentQuery(app.documentID, member.documentID));
      return values != null && values.length > 0;
    }
    return null;
  }

  @override
  List<String> retrieveAllPackageConditions() => [CONDITION_MUST_HAVE_ASSIGNMENTS];

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
