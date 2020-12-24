import 'package:eliud_core/tools/action/action_entity.dart';

class WorkflowActionEntity extends ActionEntity {
  static const String label = "Workflow";
  final String pageID;

  const WorkflowActionEntity(String appID, { this.pageID }) : super(appID, actionType : label);

  Map<String, Object> toDocument() {
    return {
      "appID": appID,
      "actionType": actionType,
      "pageID": pageID
    };
  }

  static WorkflowActionEntity fromMap(Map snap) {
    return WorkflowActionEntity(
        snap["appID"],
        pageID: snap["pageID"]
    );
  }
}
