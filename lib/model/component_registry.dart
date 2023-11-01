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
import 'package:eliud_core/tools/component/component_spec.dart';
import 'abstract_repository_singleton.dart';

import '../extensions/assignment_view_component.dart';
import '../editors/assignment_view_component_editor.dart';
import 'assignment_view_component_selector.dart';




class ComponentRegistry {

  void init() {
    Registry.registry()!.addInternalComponents('eliud_pkg_workflow', ["assignments", "assignmentViews", "workflows", ]);

    Registry.registry()!.register(componentName: "eliud_pkg_workflow_internalWidgets", componentConstructor: ListComponentFactory());
    Registry.registry()!.addDropDownSupporter("assignmentViews", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "assignmentViews", componentConstructor: AssignmentViewComponentConstructorDefault());
    Registry.registry()!.addComponentSpec('eliud_pkg_workflow', 'workflow', [
      ComponentSpec('assignmentViews', AssignmentViewComponentConstructorDefault(), AssignmentViewComponentSelector(), AssignmentViewComponentEditorConstructor(), ({String? appId}) => assignmentViewRepository(appId: appId)! ), 
    ]);
      Registry.registry()!.registerRetrieveRepository('eliud_pkg_workflow', 'assignments', ({String? appId}) => assignmentRepository(appId: appId)!);
      Registry.registry()!.registerRetrieveRepository('eliud_pkg_workflow', 'assignmentViews', ({String? appId}) => assignmentViewRepository(appId: appId)!);
      Registry.registry()!.registerRetrieveRepository('eliud_pkg_workflow', 'workflows', ({String? appId}) => workflowRepository(appId: appId)!);

  }
}


