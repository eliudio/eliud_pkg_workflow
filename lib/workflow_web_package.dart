import 'package:eliud_pkg_workflow/workflow_package.dart';
import 'package:flutter/foundation.dart';

import 'model/abstract_repository_singleton.dart';

WorkflowPackage getWorkflowPackage() => WorkflowWebPackage();

class WorkflowWebPackage extends WorkflowPackage {

  @override
  List<Object?> get props => [
    stateCONDITION_MUST_HAVE_ASSIGNMENTS,
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is WorkflowWebPackage &&
              runtimeType == other.runtimeType &&
              mapEquals(stateCONDITION_MUST_HAVE_ASSIGNMENTS, other.stateCONDITION_MUST_HAVE_ASSIGNMENTS);

}
