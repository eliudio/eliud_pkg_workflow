import 'package:eliud_core/tools/action/action_entity.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_entity.dart';
import 'package:eliud_pkg_workflow/tools/task/task_model.dart';

class WorkflowAction extends ActionModel {
  final List<TaskModel> task;

  WorkflowAction(String appId, this.task) : super(appId, actionType: WorkflowActionEntity.label);

  @override
  ActionEntity toEntity({String appId}) {
    return WorkflowActionEntity(
        appID,
        pageID: pageID
    );
  }

  static ActionModel fromEntity(WorkflowActionEntity entity) {
    return WorkflowAction(
        entity.appID,
        pageID: entity.pageID);
  }

  static Future<ActionModel> fromEntityPlus(WorkflowActionEntity entity) async {
    return fromEntity(entity);
  }

  String message() {
    return "Switching page";
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
