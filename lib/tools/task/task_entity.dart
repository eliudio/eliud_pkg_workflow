import 'package:eliud_pkg_workflow/tools/task/task_model_registry.dart';

abstract class TaskEntity {
  final String identifier;
  final String description;
  final bool executeInstantly;

  const TaskEntity(
      {required this.identifier,
      required this.description,
      required this.executeInstantly});

  Map<String, Object?> toDocument();

  static TaskEntity? fromMap(Map snap, {Map<String, String>? newDocumentIds}) {
    String? identifier = snap["identifier"];
    var mapper = TaskModelApis.apis().getMapper(identifier);
    if (mapper != null) {
      return mapper.fromMap(snap);
    }

    return null;
  }
}
