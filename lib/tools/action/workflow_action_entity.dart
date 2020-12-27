import 'dart:collection';

import 'package:eliud_core/tools/action/action_entity.dart';

class WorkflowActionEntity extends ActionEntity {
  static const String label = "Workflow";
  final String workflowId;

  const WorkflowActionEntity({String appId, int readCondition, int privilegeLevelRequired, String packageCondition, this.workflowId}) : super(appId, readCondition: readCondition, privilegeLevelRequired: privilegeLevelRequired, packageCondition: packageCondition, actionType : label);

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    theDocument["appID"] = appID;
    theDocument["actionType"] = actionType;
    if (workflowId != null) theDocument["workflowId"] = workflowId;
    else theDocument["workflowId"] = null;
    theDocument['readCondition'] = readCondition;
    theDocument['privilegeLevelRequired'] = privilegeLevelRequired;
    theDocument['packageCondition'] = packageCondition;

    return theDocument;
  }

  static WorkflowActionEntity fromMap(Map snap) {
    return WorkflowActionEntity(
        appId     : snap["appID"],
        workflowId: snap["workflowId"],
        readCondition: snap['readCondition'],
        privilegeLevelRequired: snap['privilegeLevelRequired'],
        packageCondition: snap['packageCondition'],
    );
  }
}
