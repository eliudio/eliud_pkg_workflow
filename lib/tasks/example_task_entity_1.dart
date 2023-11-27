import 'package:eliud_pkg_workflow_model/tools/task/task_entity.dart';

import 'example_task_model_1.dart';

class ExampleTaskEntity1 extends TaskEntity {
  final String? extraParameter;

  ExampleTaskEntity1(
      {this.extraParameter,
      required super.description,
      required super.executeInstantly})
      : super(identifier: ExampleTaskModel1.label);

  @override
  Map<String, Object?> toDocument() {
    return {
      "identifier": identifier,
      "extraParameter": extraParameter,
      "description": description,
      "executeInstantly": executeInstantly,
    };
  }
}
