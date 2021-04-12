import 'package:eliud_pkg_workflow/tools/task/task_model.dart';
import 'package:equatable/equatable.dart';

abstract class TaskEntity {
  final String? taskString;
  final String? description;
  final bool? executeInstantly;

  const TaskEntity( { this.taskString, this.description, this.executeInstantly });

  Map<String, Object?> toDocument();

  static TaskEntity? fromMap(Map snap) {
    String? taskString = snap["taskString"];
    var mapper = TaskModelRegistry.registry()!.getMapper(taskString);
    if (mapper != null) {
      return mapper.fromMap(snap);
    }

    return null;
  }
}

class ExampleTaskEntity1 extends TaskEntity {
  static String label = "EXAMPLE_TASK_1";
  final String? extraParameter;

  ExampleTaskEntity1({ this.extraParameter, String? description, bool? executeInstantly }) : super(taskString: label, description: description, executeInstantly: executeInstantly);

  Map<String, Object?> toDocument() {
    return {
      "taskString": taskString,
      "extraParameter": extraParameter,
      "description": description,
      "executeInstantly": executeInstantly,
    };
  }

}
