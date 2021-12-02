import 'package:eliud_pkg_workflow/workflow_package.dart';
import 'package:flutter/foundation.dart';
import 'model/component_registry.dart';

class WorkflowMobilePackage extends WorkflowPackage {

  @override
  List<Object?> get props => [
    stateCONDITION_MUST_HAVE_ASSIGNMENTS,
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is WorkflowMobilePackage &&
              runtimeType == other.runtimeType &&
              mapEquals(stateCONDITION_MUST_HAVE_ASSIGNMENTS, other.stateCONDITION_MUST_HAVE_ASSIGNMENTS);
}
