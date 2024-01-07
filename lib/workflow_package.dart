import 'dart:async';
import 'package:eliud_core/access/access_event.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_main/apis/apis.dart';
import 'package:eliud_core_main/apis/action_api/actions/action_model_registry.dart';
import 'package:eliud_core_main/apis/wizard_api/new_app_wizard_info.dart';
import 'package:eliud_core/core_package.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core_main/tools/etc/member_collection_info.dart';
import 'package:eliud_core_model/model/access_model.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_pkg_workflow_model/model/repository_singleton.dart';
import 'package:eliud_pkg_notifications/notifications_package.dart';
import 'package:eliud_pkg_workflow/editors/assignment_view_component_editor.dart';
import 'package:eliud_pkg_workflow/extensions/assignment_view_component.dart';
import 'package:eliud_pkg_workflow_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/tasks/example_task_editor.dart';
import 'package:eliud_pkg_workflow/tasks/example_task_model_1.dart';
import 'package:eliud_pkg_workflow/tasks/example_task_model_1_mapper.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_entity.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_handler.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_model.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliud_router;
import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_pkg_workflow_model/model/assignment_model.dart';
import 'package:eliud_pkg_workflow_model/model/component_registry.dart';
import 'package:eliud_pkg_workflow_model/tools/task/task_model_registry.dart';
import 'wizards/assignment_dashboard_dialog_wizard.dart';

import 'package:eliud_pkg_workflow/workflow_package_stub.dart'
    if (dart.library.io) 'workflow_mobile_package.dart'
    if (dart.library.html) 'workflow_web_package.dart';

abstract class WorkflowPackage extends Package {
  WorkflowPackage() : super('eliud_pkg_workflow');

  final Map<String, StreamSubscription<List<AssignmentModel?>>> subscription =
      {};
  final Map<String, bool?> stateConditionMustHaveAssignments = {};
  static final String conditionMustHaveAssignments = 'MustHaveAssignments';

  static EliudQuery getOpenAssignmentsQuery(String appId, String assigneeId) {
    return EliudQuery(theConditions: [
      EliudQueryCondition('assigneeId', isEqualTo: assigneeId),
      EliudQueryCondition('appId', isEqualTo: appId),
      EliudQueryCondition('status', isEqualTo: AssignmentStatus.open.index)
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
        var value = list.isNotEmpty;
        if (!c.isCompleted) {
          // the first time we get this trigger, it's upon entry of the getAndSubscribe. Now we simply return the value
          stateConditionMustHaveAssignments[appId] = value;
          c.complete([
            PackageConditionDetails(
                packageName: packageName,
                conditionName: conditionMustHaveAssignments,
                value: value)
          ]);
        } else {
          // subsequent calls we get this trigger, it's when the date has changed. Now add the event to the bloc
          if (value != stateConditionMustHaveAssignments[appId]) {
            stateConditionMustHaveAssignments[appId] = value;
            accessBloc.add(UpdatePackageConditionEvent(
                app, this, conditionMustHaveAssignments, value));
          }
        }
      }, eliudQuery: getOpenAssignmentsQuery(appId, member.documentID));
      return c.future;
    } else {
      stateConditionMustHaveAssignments[appId] = false;
      return Future.value([
        PackageConditionDetails(
            packageName: packageName,
            conditionName: conditionMustHaveAssignments,
            value: false)
      ]);
    }
  }

  @override
  List<String> retrieveAllPackageConditions() => [conditionMustHaveAssignments];

  @override
  void init() {
    ComponentRegistry().init(
      AssignmentViewComponentConstructorDefault(),
      AssignmentViewComponentEditorConstructor(),
    );

    // wizards
    Apis.apis().getWizardApi().register(AssignmentDashboardDialogWizard());

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
        editor: (app, model) =>
            ExampleTaskModel1EditorWidget(app: app, model: model),
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
  @override
  void registerDependencies(Eliud eliud) {
    eliud.registerPackage(CorePackage.instance());
    eliud.registerPackage(NotificationsPackage.instance());
  }
}
