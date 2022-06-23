import 'package:eliud_core/core/base/model_base.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';
import 'package:eliud_pkg_workflow/tools/task/task_entity.dart';
import 'package:eliud_pkg_workflow/tools/task/task_model.dart';
import 'package:flutter/cupertino.dart';

import 'example_task_entity_1.dart';

class ExampleTaskModel1 extends TaskModel {
  static String label = "EXAMPLE_TASK_1";
  static String definition = "An example task 1, for illustration purposes only";

  String? extraParameter;

  ExampleTaskModel1(
      {required String identifier, this.extraParameter, required String description, required bool executeInstantly})
      : super(identifier: identifier, description: description, executeInstantly: executeInstantly);

  @override
  TaskEntity toEntity({String? appId, List<ModelBase>? referencesCollector}) {
    return ExampleTaskEntity1(
        description: description, executeInstantly: executeInstantly);
  }

  static ExampleTaskModel1 fromEntity(ExampleTaskEntity1 entity) =>
      ExampleTaskModel1(
          identifier: entity.identifier,
          extraParameter: entity.extraParameter,
          description: entity.description,
          executeInstantly: entity.executeInstantly);
  static ExampleTaskEntity1 fromMap(Map snap) => ExampleTaskEntity1(
      extraParameter: snap["extraParameter"],
      description: snap["description"],
      executeInstantly: snap["executeInstantly"]);

  @override
  Future<void> startTask(AppModel app,
      BuildContext context, String? memberId, AssignmentModel? assignmentModel) {
    throw UnimplementedError();
  }
}

