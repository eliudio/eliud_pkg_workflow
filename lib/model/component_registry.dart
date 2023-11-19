/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/component_registry.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/internal_component.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core_model/tools/component/component_spec.dart';
import 'abstract_repository_singleton.dart';

import '../extensions/assignment_view_component.dart';
import '../editors/assignment_view_component_editor.dart';
import 'assignment_view_component_selector.dart';

/* 
 * Component registry contains a list of components
 */
class ComponentRegistry {
  /* 
   * Initialise the component registry
   */
  void init() {
    Apis.apis().addInternalComponents('eliud_pkg_workflow', [
      "assignments",
      "assignmentViews",
      "workflows",
    ]);

    Apis.apis().register(
        componentName: "eliud_pkg_workflow_internalWidgets",
        componentConstructor: ListComponentFactory());
    Apis.apis().addDropDownSupporter(
        "assignmentViews", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "assignmentViews",
        componentConstructor: AssignmentViewComponentConstructorDefault());
    Apis.apis().addComponentSpec('eliud_pkg_workflow', 'workflow', [
      ComponentSpec(
          'assignmentViews',
          AssignmentViewComponentConstructorDefault(),
          AssignmentViewComponentSelector(),
          AssignmentViewComponentEditorConstructor(),
          ({String? appId}) => assignmentViewRepository(appId: appId)!),
    ]);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_workflow',
        'assignments',
        ({String? appId}) => assignmentRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_workflow',
        'assignmentViews',
        ({String? appId}) => assignmentViewRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository('eliud_pkg_workflow',
        'workflows', ({String? appId}) => workflowRepository(appId: appId)!);
  }
}
