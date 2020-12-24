import 'dart:collection';

import 'package:eliud_core/tools/action/action_entity.dart';
import 'package:eliud_pkg_workflow/model/workflow_entity.dart';
import 'package:eliud_pkg_workflow/tools/task/task_entity.dart';

class WorkflowActionEntity extends ActionEntity {
  static const String label = "Workflow";
  final String workflowId;

  const WorkflowActionEntity({String appId, this.workflowId}) : super(appId, actionType : label);

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    theDocument["appID"] = appID;
    theDocument["actionType"] = actionType;
    if (workflowId != null) theDocument["workflowId"] = workflowId;
    else theDocument["workflowId"] = null;
    return theDocument;
  }

  static WorkflowActionEntity fromMap(Map snap) {
    return WorkflowActionEntity(
        appId     : snap["appID"],
        workflowId: snap["workflowId"]
    );
  }
}
