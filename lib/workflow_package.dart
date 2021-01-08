import 'dart:async';

import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_entity.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_model.dart';
import 'package:eliud_pkg_workflow/tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/tools/task/task_entity.dart';
import 'package:eliud_pkg_workflow/tools/workflow_action_handler.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliud_router;
import 'package:eliud_core/package/package_with_subscription.dart';

import 'package:eliud_pkg_workflow/model/component_registry.dart';

import 'model/assignment_model.dart';

// Todo: clearly we can introduce some caching, as we are listening as well as querying the same data. So, instead: keep a cache and update the cache adnd use it from within the isConditionOk
abstract class WorkflowPackage extends PackageWithSubscription {
  static final String CONDITION_MUST_HAVE_ASSIGNMENTS = 'MustHaveAssignments';
  bool previousState = null;

  static EliudQuery getOpenAssignmentsQuery(String appId, String assigneeId) {
    return EliudQuery(
        theConditions: [
          EliudQueryCondition('assigneeId', isEqualTo: assigneeId),
          EliudQueryCondition('appId', isEqualTo: appId),
          EliudQueryCondition('status', isEqualTo: AssignmentStatus.Open.index)
        ]
    );
  }

  void resubscribe(AppModel app, MemberModel currentMember) {
    String appId = app.documentID;
    subscription = assignmentRepository(appId: appId).listen((list) {
      // If we have a different set of assignments, i.e. it has assignments were before it didn't or vice versa,
      // then we must inform the AccessBloc, so that it can refresh the state
      bool currentState = list.length > 0;
      if (currentState != previousState) {
        previousState = currentState;
        accessBloc.add(MemberUpdated(currentMember));
      }
    }, orderBy: 'timestamp', descending: true, eliudQuery: getOpenAssignmentsQuery(appId, currentMember.documentID));
  }

  @override
  Future<bool> isConditionOk(String packageCondition, AppModel app, MemberModel member, bool isOwner, bool isBlocked, PrivilegeLevel privilegeLevel) async {
    if (packageCondition == CONDITION_MUST_HAVE_ASSIGNMENTS) {
      if (member == null) return false;
      var values = await assignmentRepository(appId: app.documentID).valuesList(eliudQuery: getOpenAssignmentsQuery(app.documentID, member.documentID));
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
