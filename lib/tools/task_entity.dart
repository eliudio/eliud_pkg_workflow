import 'package:eliud_pkg_workflow/tools/task_model.dart';
import 'package:equatable/equatable.dart';

abstract class TaskEntity extends Equatable {
  final String taskString;

  const TaskEntity( { this.taskString });
  Map<String, Object> toJson();
  @override
  List<Object> get props;
  @override
  String toString();
  Map<String, Object> toDocument();

  static TaskEntity fromMap(Map snap) {
    String taskString = snap["taskString"];
    var mapper = TaskModelRegistry.registry().getMapper(taskString);
    if (mapper != null) {
      return mapper.fromMap(snap);
    }

    return null;
  }
}

class ExampleTaskEntity1 extends TaskEntity {
  static String label = "EXAMPLE_TASK_1";
  final String extraParameter;

  ExampleTaskEntity1({ this.extraParameter }) : super(taskString: label);

  Map<String, Object> toJson() {
    return <String, dynamic>{
      "taskString": taskString,
      "extraParameter": extraParameter,
    };
  }

  @override
  List<Object> get props => [ taskString, extraParameter ];

  Map<String, Object> toDocument() {
    return {
      "taskString": taskString,
      "extraParameter": extraParameter
    };
  }
}
