import 'dart:collection';

import 'package:eliud_core/model/conditions_entity.dart';
import 'package:eliud_core/tools/action/action_entity.dart';

class WorkflowActionEntity extends ActionEntity {
  static const String label = "Workflow";
  final String? workflowId;

  const WorkflowActionEntity({String? appId, ConditionsEntity? conditions, this.workflowId}) : super(appId, conditions: conditions, actionType : label);

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    theDocument["appID"] = appID;
    theDocument["actionType"] = actionType;
    if (workflowId != null) theDocument["workflowId"] = workflowId;
    else theDocument["workflowId"] = null;
    theDocument['conditions'] = conditions == null ? null : conditions!.toDocument();

    return theDocument;
  }

  static WorkflowActionEntity? fromMap(Map snap) {
    var fromMap = ConditionsEntity.fromMap(snap['conditions']);
    if (ConditionsEntity.fromMap(snap['conditions']) != null) {
      return WorkflowActionEntity(
        appId: snap["appID"],
        workflowId: snap["workflowId"],
        conditions: fromMap!,
      );
    } else {
      return null;
    }
  }
}
