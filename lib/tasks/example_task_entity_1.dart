import 'package:eliud_pkg_workflow/tools/task/task_entity.dart';
import 'package:equatable/equatable.dart';

import 'example_task_model_1.dart';

class ExampleTaskEntity1 extends TaskEntity {
  final String? extraParameter;

  ExampleTaskEntity1(
      {this.extraParameter,
      required String description,
      required bool executeInstantly})
      : super(
            identifier: ExampleTaskModel1.label,
            description: description,
            executeInstantly: executeInstantly);

  Map<String, Object?> toDocument() {
    return {
      "identifier": identifier,
      "extraParameter": extraParameter,
      "description": description,
      "executeInstantly": executeInstantly,
    };
  }
}
