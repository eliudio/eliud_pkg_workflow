import 'package:eliud_core/model/conditions_model.dart';
import 'package:eliud_core/tools/action/action_entity.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/workflow_model.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_entity.dart';

// Start a workflow
class WorkflowActionModel extends ActionModel {
  final WorkflowModel workflow;

  WorkflowActionModel(String appId, { this.workflow, ConditionsModel conditions} ) : super(appId, actionType: WorkflowActionEntity.label, conditions: conditions);

  @override
  ActionEntity toEntity({String appId}) {
    return WorkflowActionEntity(
        workflowId: (workflow != null) ? workflow.documentID : null,
        conditions: (conditions != null) ? conditions.toEntity(): null,
        appId: appId);
  }

  static ActionModel fromEntity(WorkflowActionEntity entity) {
    if (entity == null) return null;
    return WorkflowActionModel(
      entity.appID,
      conditions: ConditionsModel.fromEntity(entity.conditions),
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

    return WorkflowActionModel(
        entity.appID,
        conditions: ConditionsModel.fromEntity(entity.conditions),
        workflow: workFlowModel
    );
  }

  String message() {
    return "Workflow";
  }
}

class WorkflowActionMapper implements ActionModelMapper {
  @override
  ActionModel fromEntity(ActionEntity entity) => WorkflowActionModel.fromEntity(entity);

  @override
  Future<ActionModel> fromEntityPlus(ActionEntity entity) => WorkflowActionModel.fromEntityPlus(entity);

  @override
  ActionEntity fromMap(Map map) => WorkflowActionEntity.fromMap(map);
}
