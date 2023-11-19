import 'package:eliud_core/core/wizards/tools/document_identifier.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/core/wizards/widgets/action_specification_widget.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core/model/display_conditions_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core_model/style/frontend/has_text.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/wizards/join_action_specification_parameters.dart';
import 'package:eliud_pkg_workflow/workflow_package.dart';
import 'package:flutter/material.dart';
import 'builders/dialog/assignment_dialog_builder.dart';

class AssignmentDashboardDialogWizard extends NewAppWizardInfo {
  static String assignmentDashboardDialogId = 'assignment_dashboard';

  AssignmentDashboardDialogWizard() : super('assignment', 'Assignment');

  @override
  String getPackageName() => "eliud_pkg_workflow";

  @override
  NewAppWizardParameters newAppWizardParameters() =>
      JoinActionSpecificationParameters(
        requiresAccessToLocalFileSystem: false,
        paymentType: JoinPaymentType.manual,
        availableInLeftDrawer: false,
        availableInRightDrawer: false,
        availableInAppBar: true,
        availableInHomeMenu: false,
        available: false,
      );

  List<MenuItemModel>? getThoseMenuItems(String uniqueId, AppModel app) => [
        MenuItemModel(
            documentID: 'assignments',
            text: 'Assignments',
            description: 'Assignments',
            icon: IconModel(
                codePoint: Icons.playlist_add_check.codePoint,
                fontFamily: Icons.notifications.fontFamily),
            action: OpenDialog(app,
                dialogID: constructDocumentId(
                    uniqueId: uniqueId,
                    documentId: assignmentDashboardDialogId),
                conditions: DisplayConditionsModel(
                    privilegeLevelRequired:
                        PrivilegeLevelRequired.noPrivilegeRequired,
                    packageCondition:
                        WorkflowPackage.conditionMustHaveAssignments,
                    conditionOverride: ConditionOverride
                        .inclusiveForBlockedMembers // allow blocked members to see
                    )))
      ];

  @override
  List<NewAppTask>? getCreateTasks(
    String uniqueId,
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
          await AssignmentDialogBuilder(
                  uniqueId, app, assignmentDashboardDialogId)
              .create();
        });
        return tasks;
      }
    } else {
      throw Exception('Unexpected class for parameters: $parameters');
    }
    return null;
  }

  @override
  AppModel updateApp(
    String uniqueId,
    NewAppWizardParameters parameters,
    AppModel adjustMe,
  ) =>
      adjustMe;

  @override
  String? getPageID(String uniqueId, NewAppWizardParameters parameters,
          String pageType) =>
      null;

  @override
  ActionModel? getAction(
    String uniqueId,
    NewAppWizardParameters parameters,
    AppModel app,
    String actionType,
  ) =>
      null;

  @override
  List<MenuItemModel>? getMenuItemsFor(String uniqueId, AppModel app,
      NewAppWizardParameters parameters, MenuType type) {
    if (parameters is JoinActionSpecificationParameters) {
      if (parameters.joinActionSpecifications.should(type)) {
        return getThoseMenuItems(uniqueId, app);
      }
    } else {
      throw Exception('Unexpected class for parameters: $parameters');
    }
    return null;
  }

  @override
  Widget wizardParametersWidget(
      AppModel app, BuildContext context, NewAppWizardParameters parameters) {
    if (parameters is JoinActionSpecificationParameters) {
      return ActionSpecificationWidget(
          app: app,
          actionSpecification: parameters.joinActionSpecifications,
          label: 'Generate a default Assignment Dialog');
    } else {
      return text(app, context, 'Unexpected class for parameters: $parameters');
    }
  }

  @override
  PublicMediumModel? getPublicMediumModel(String uniqueId,
          NewAppWizardParameters parameters, String mediumType) =>
      null;
}
