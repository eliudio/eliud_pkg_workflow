import 'package:eliud_core/tools/action/action_entity.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/workflow_model.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_entity.dart';
import 'package:eliud_pkg_workflow/tools/task/task_model.dart';

// Start a workflow
class WorkflowAction extends ActionModel {
  final WorkflowModel workflow;

  WorkflowAction({String appId, this.workflow}) : super(appId, actionType: WorkflowActionEntity.label);

  @override
  ActionEntity toEntity({String appId}) {
    return WorkflowActionEntity(
        workflowId: (workflow != null) ? workflow.documentID : null,
        appId: appId);
  }

  static ActionModel fromEntity(WorkflowActionEntity entity) {
    if (entity == null) return null;
    return WorkflowAction(
      appId: entity.appID,
    );
  }
  static Future<ActionModel> fromEntityPlus(WorkflowActionEntity entity, { String appId}) async {
    WorkflowModel workFlowModel;
    if (entity.workflowId != null) {
      try {
        await workflowRepository(appId: entity.appID).get(entity.workflowId).then((val) {
          workFlowModel = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return WorkflowAction(
      appId: entity.appID,
      workflow: workFlowModel
    );
  }

  String message() {
    return "Workflow";
  }
}

class WorkflowActionMapper implements ActionModelMapper {
  @override
  ActionModel fromEntity(ActionEntity entity) => WorkflowAction.fromEntity(entity);

  @override
  Future<ActionModel> fromEntityPlus(ActionEntity entity) => WorkflowAction.fromEntityPlus(entity);

  @override
  ActionEntity fromMap(Map map) => WorkflowActionEntity.fromMap(map);
}
