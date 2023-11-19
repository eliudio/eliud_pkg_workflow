import 'package:eliud_core/core/base/model_base.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core/model/display_conditions_model.dart';
import 'package:eliud_core/tools/action/action_entity.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/workflow_model.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_entity.dart';

// Start a workflow
class WorkflowActionModel extends ActionModel {
  final WorkflowModel? workflow;

  WorkflowActionModel(super.app, {this.workflow, super.conditions})
      : super(actionType: WorkflowActionEntity.label);

  @override
  WorkflowActionEntity toEntity({String? appId}) {
    return WorkflowActionEntity(
        workflowId: (workflow != null) ? workflow!.documentID : null,
        conditions: (conditions != null) ? conditions!.toEntity() : null,
        appId: appId);
  }

  @override
  Future<List<ModelReference>> collectReferences({
    String? appId,
  }) async {
    List<ModelReference> referencesCollector = [];
    if (workflow != null) {
      referencesCollector.add(ModelReference(
          WorkflowModel.packageName, WorkflowModel.id, workflow!));
    }
    return referencesCollector;
  }

  static Future<WorkflowActionModel?> fromEntity(
      WorkflowActionEntity? entity) async {
    if (entity == null) return null;
    if (entity.appID == null) {
      throw Exception('entity WorkflowActionModel.appID is null');
    }
    var app = await appRepository()!.get(entity.appID);
    if (app != null) {
      return WorkflowActionModel(
        app,
        conditions: await DisplayConditionsModel.fromEntity(entity.conditions),
      );
    } else {
      throw Exception('App with ${entity.appID!} not found');
    }
  }

  static Future<WorkflowActionModel?> fromEntityPlus(
      WorkflowActionEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;
    if (entity.appID == null) {
      throw Exception('entity WorkflowActionModel.appID is null');
    }
    WorkflowModel? workFlowModel;
    if (entity.workflowId != null) {
      try {
        await workflowRepository(appId: entity.appID)!
            .get(entity.workflowId)
            .then((val) {
          workFlowModel = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    var app = await appRepository()!.get(entity.appID);
    if (app != null) {
      return WorkflowActionModel(app,
          conditions:
              await DisplayConditionsModel.fromEntity(entity.conditions),
          workflow: workFlowModel);
    } else {
      throw Exception('App with ${entity.appID!} not found');
    }
  }

  @override
  String message() {
    return "Workflow";
  }

  @override
  String describe() {
    if (workflow == null) {
      return 'Incorrect workflow';
    } else {
      return 'Run workflow ${workflow!.documentID}';
    }
  }

  @override
  ActionModel copyWith(AppModel newApp) =>
      WorkflowActionModel(newApp, workflow: workflow, conditions: conditions);

  @override
  String toString() => describe();
}

class WorkflowActionMapper implements ActionModelMapper {
  @override
  Future<ActionModel?> fromEntity(AppModel app, ActionEntity entity) =>
      WorkflowActionModel.fromEntity(entity as WorkflowActionEntity);

  @override
  Future<ActionModel?> fromEntityPlus(AppModel app, ActionEntity entity) =>
      WorkflowActionModel.fromEntityPlus(entity as WorkflowActionEntity);

  @override
  ActionEntity? fromMap(Map map) => WorkflowActionEntity.fromMap(map);
}
