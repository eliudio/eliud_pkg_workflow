import 'package:eliud_core/model/display_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/action/action_entity.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/workflow_model.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_entity.dart';
import 'package:flutter/material.dart';

// Start a workflow
class WorkflowActionModel extends ActionModel {
  final WorkflowModel? workflow;

  WorkflowActionModel(String appId, { this.workflow, DisplayConditionsModel? conditions} ) : super(appId, actionType: WorkflowActionEntity.label, conditions: conditions);

  @override
  WorkflowActionEntity toEntity({String? appId}) {
    return WorkflowActionEntity(
        workflowId: (workflow != null) ? workflow!.documentID : null,
        conditions: (conditions != null) ? conditions!.toEntity(): null,
        appId: appId);
  }

  static WorkflowActionModel? fromEntity(WorkflowActionEntity? entity) {
    if (entity == null) return null;
    if (entity.appID == null) throw Exception('entity WorkflowActionModel.appID is null');
    return WorkflowActionModel(
      entity.appID!,
      conditions: DisplayConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<WorkflowActionModel?> fromEntityPlus(WorkflowActionEntity? entity, { String? appId}) async {
    if (entity == null) return null;
    if (entity.appID == null) throw Exception('entity WorkflowActionModel.appID is null');
    WorkflowModel? workFlowModel;
    if (entity.workflowId != null) {
      try {
        await workflowRepository(appId: entity.appID)!.get(entity.workflowId).then((val) {
          workFlowModel = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return WorkflowActionModel(
        entity.appID!,
        conditions: DisplayConditionsModel.fromEntity(entity.conditions),
        workflow: workFlowModel
    );
  }

  String message() {
    return "Workflow";
  }

  @override
  String describe() {
    if (workflow == null) {
      return 'Incorrect workflow';
    } else {
      return 'Run workflow '  + (workflow!.documentID ?? 'no ID');
    }
  }
}

class WorkflowActionMapper implements ActionModelMapper {
  @override
  ActionModel? fromEntity(ActionEntity entity) => WorkflowActionModel.fromEntity(entity as WorkflowActionEntity);

  @override
  Future<ActionModel?> fromEntityPlus(ActionEntity entity) => WorkflowActionModel.fromEntityPlus(entity as WorkflowActionEntity);

  @override
  ActionEntity? fromMap(Map map) => WorkflowActionEntity.fromMap(map);
}
