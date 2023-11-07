import 'package:eliud_pkg_workflow/workflow_package.dart';
import 'package:flutter/foundation.dart';

WorkflowPackage getWorkflowPackage() => WorkflowWebPackage();

class WorkflowWebPackage extends WorkflowPackage {
  @override
  List<Object?> get props => [
        stateConditionMustHaveAssignments,
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkflowWebPackage &&
          runtimeType == other.runtimeType &&
          mapEquals(stateConditionMustHaveAssignments,
              other.stateConditionMustHaveAssignments);

  @override
  int get hashCode => stateConditionMustHaveAssignments.hashCode;
}
