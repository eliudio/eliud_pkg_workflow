import 'package:eliud_core/core/wizards/registry/action_specification.dart';
import 'package:eliud_core/core/wizards/registry/new_app_wizard_info_with_action_specification.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/core/wizards/widgets/action_specification_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/display_conditions_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/wizards/join_action_specification_parameters.dart';
import 'package:eliud_pkg_workflow/workflow_package.dart';
import 'package:flutter/material.dart';

import 'builders/dialog/assignment_dialog_builder.dart';

class AssignmentDashboardDialogWizard
    extends NewAppWizardInfo {
  static String ASSIGNMENT_DASHBOARD_DIALOG_ID = 'assignment_dashboard';

  AssignmentDashboardDialogWizard()
      : super('assignment', 'Assignment');

  @override
  NewAppWizardParameters newAppWizardParameters() => JoinActionSpecificationParameters(
    requiresAccessToLocalFileSystem: false,
    paymentType: JoinPaymentType.Manual,
    availableInLeftDrawer: false,
    availableInRightDrawer: false,
    availableInAppBar: true,
    availableInHomeMenu: false,
    available: false,
  );

  @override
  List<MenuItemModel>? getThoseMenuItems(AppModel app) =>[
      MenuItemModel(
          documentID: 'assignments',
          text: 'Assignments',
          description: 'Assignments',
          icon: IconModel(
              codePoint: Icons.playlist_add_check.codePoint,
              fontFamily: Icons.notifications.fontFamily),
          action: OpenDialog(app,
              dialogID: ASSIGNMENT_DASHBOARD_DIALOG_ID,
              conditions: DisplayConditionsModel(
                  packageCondition:
                  WorkflowPackage.CONDITION_MUST_HAVE_ASSIGNMENTS,
                  conditionOverride: ConditionOverride
                      .InclusiveForBlockedMembers // allow blocked members to see
              )))];

  @override
  List<NewAppTask>? getCreateTasks(
    AppModel app,
    NewAppWizardParameters parameters,
    MemberModel member,
    HomeMenuProvider homeMenuProvider,
    AppBarProvider appBarProvider,
    DrawerProvider leftDrawerProvider,
    DrawerProvider rightDrawerProvider,
  ) {
    if (parameters is JoinActionSpecificationParameters) {
      var assignmentSpecifications = parameters.joinActionSpecifications;
      if (assignmentSpecifications.shouldCreatePageDialogOrWorkflow()) {
        List<NewAppTask> tasks = [];
        tasks.add(() async {
          print("Assignment Dialog");
          await AssignmentDialogBuilder(app, ASSIGNMENT_DASHBOARD_DIALOG_ID)
              .create();
        });
        return tasks;
      }
    } else {
      throw Exception(
          'Unexpected class for parameters: ' + parameters.toString());
    }
  }

  @override
  AppModel updateApp(
    NewAppWizardParameters parameters,
    AppModel adjustMe,
  ) =>
      adjustMe;

  @override
  String? getPageID(String pageType) => null;

  @override
  ActionModel? getAction(AppModel app, String actionType) => null;

  @override
  List<MenuItemModel>? getMenuItemsFor(AppModel app, NewAppWizardParameters parameters, MenuType type) {
    if (parameters is JoinActionSpecificationParameters) {
      var feedSpecifications = parameters.joinActionSpecifications;
      bool generate = (type == MenuType.leftDrawerMenu) &&
          feedSpecifications.availableInLeftDrawer ||
          (type == MenuType.rightDrawerMenu) &&
              feedSpecifications.availableInRightDrawer ||
          (type == MenuType.bottomNavBarMenu) &&
              feedSpecifications.availableInHomeMenu ||
          (type == MenuType.appBarMenu) && feedSpecifications.availableInAppBar;
      if (generate) {
        return getThoseMenuItems(app);
      }
    } else {
      throw Exception(
          'Unexpected class for parameters: ' + parameters.toString());
    }
    return null;
  }

  @override
  Widget wizardParametersWidget(AppModel app, BuildContext context, NewAppWizardParameters parameters) {
    if (parameters is JoinActionSpecificationParameters) {
      return ActionSpecificationWidget(
          app: app,
          enabled: true,
          actionSpecification: parameters.joinActionSpecifications,
          label: 'Generate Assignment Dialog');
    } else {
      return text(app, context,
          'Unexpected class for parameters: ' + parameters.toString());
    }
  }
}
