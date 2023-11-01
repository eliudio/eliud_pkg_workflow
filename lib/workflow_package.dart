import 'dart:async';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/core_package.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_notifications/notifications_package.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/tasks/example_task_editor.dart';
import 'package:eliud_pkg_workflow/tasks/example_task_model_1.dart';
import 'package:eliud_pkg_workflow/tasks/example_task_model_1_mapper.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_entity.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_handler.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_model.dart';
import 'package:eliud_pkg_workflow/tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliud_router;
import 'package:eliud_pkg_workflow/tools/task/task_model_registry.dart';
import 'model/repository_singleton.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/access_event.dart';

import 'package:eliud_pkg_workflow/model/component_registry.dart';

import 'model/assignment_model.dart';
import 'wizards/assignment_dashboard_dialog_wizard.dart';

import 'package:eliud_pkg_workflow/workflow_package_stub.dart'
if (dart.library.io) 'workflow_mobile_package.dart'
if (dart.library.html) 'workflow_web_package.dart';

abstract class WorkflowPackage extends Package {
  WorkflowPackage() : super('eliud_pkg_workflow');

  Map<String, StreamSubscription<List<AssignmentModel?>>> subscription = {};
  Map<String, bool?> stateCONDITION_MUST_HAVE_ASSIGNMENTS = {};
  static final String CONDITION_MUST_HAVE_ASSIGNMENTS = 'MustHaveAssignments';

  static EliudQuery getOpenAssignmentsQuery(String appId, String assigneeId) {
    return EliudQuery(theConditions: [
      EliudQueryCondition('assigneeId', isEqualTo: assigneeId),
      EliudQueryCondition('appId', isEqualTo: appId),
      EliudQueryCondition('status', isEqualTo: AssignmentStatus.Open.index)
    ]);
  }

  @override
  Future<List<PackageConditionDetails>>? getAndSubscribe(
      AccessBloc accessBloc,
      AppModel app,
      MemberModel? member,
      bool isOwner,
      bool? isBlocked,
      PrivilegeLevel? privilegeLevel) {
    var appId = app.documentID;
    subscription[appId]?.cancel();
    if (member != null) {
      final c = Completer<List<PackageConditionDetails>>();
      subscription[appId] = assignmentRepository(appId: appId)!.listen((list) {
        // If we have a different set of assignments, i.e. it has assignments were before it didn't or vice versa,
        // then we must inform the AccessBloc, so that it can refresh the state
        var value = list.length > 0;
        if (!c.isCompleted) {
          // the first time we get this trigger, it's upon entry of the getAndSubscribe. Now we simply return the value
          stateCONDITION_MUST_HAVE_ASSIGNMENTS[appId] = value;
          c.complete([
            PackageConditionDetails(
                packageName: packageName,
                conditionName: CONDITION_MUST_HAVE_ASSIGNMENTS,
                value: value)
          ]);
        } else {
          // subsequent calls we get this trigger, it's when the date has changed. Now add the event to the bloc
          if (value != stateCONDITION_MUST_HAVE_ASSIGNMENTS[appId]) {
            stateCONDITION_MUST_HAVE_ASSIGNMENTS[appId] = value;
            accessBloc.add(UpdatePackageConditionEvent(
                app, this, CONDITION_MUST_HAVE_ASSIGNMENTS, value));
          }
        }
      }, eliudQuery: getOpenAssignmentsQuery(appId, member.documentID));
      return c.future;
    } else {
      stateCONDITION_MUST_HAVE_ASSIGNMENTS[appId] = false;
      return Future.value([
        PackageConditionDetails(
            packageName: packageName,
            conditionName: CONDITION_MUST_HAVE_ASSIGNMENTS,
            value: false)
      ]);
    }
  }

  @override
  List<String> retrieveAllPackageConditions() =>
      [CONDITION_MUST_HAVE_ASSIGNMENTS];

  @override
  void init() {
    ComponentRegistry().init();

    // wizards
    NewAppWizardRegistry.registry().register(AssignmentDashboardDialogWizard());

    // initialise repository
    AbstractRepositorySingleton.singleton = RepositorySingleton();

    // Register action handler for the workflow action
    eliud_router.Router.register(WorkflowActionHandler());

    // Register a mapper for an extra action: the mapper for the WorkflowAction
    ActionModelRegistry.registry()!
        .addMapper(WorkflowActionEntity.label, WorkflowActionMapper());

    // Register a task
    TaskModelRegistry.registry()!.addTask(
        identifier: ExampleTaskModel1.label,
        definition: ExampleTaskModel1.definition,
        editor: (app, model) => ExampleTaskModel1EditorWidget(app: app, model: model),
        createNewInstance: () => ExampleTaskModel1(
            identifier: ExampleTaskModel1.label,
            description: 'new example task model 1',
            executeInstantly: true),
        mapper: ExampleTaskModel1Mapper());
  }

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() =>
      AbstractRepositorySingleton.collections;

  static WorkflowPackage instance() => getWorkflowPackage();

  /*
   * Register depending packages
   */
  void registerDependencies(Eliud eliud) {
    eliud.registerPackage(CorePackage.instance());
    eliud.registerPackage(NotificationsPackage.instance());
  }
}
