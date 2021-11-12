import 'dart:collection';
import 'package:eliud_pkg_workflow/tools/task/task_model_mapper.dart';
import 'package:flutter/cupertino.dart';

typedef Widget TaskEditor(model);
typedef dynamic CreateNewInstance();

class TaskDetails {
  final String identifier;
  final String definition;
  final TaskEditor? editor;
  final CreateNewInstance createNewInstance;
  final TaskModelMapper mapper;

  TaskDetails({required this.identifier, required this.definition, this.editor, required this.mapper, required this.createNewInstance});
}

typedef void TaskEditorFeedback(bool status); // true is ok

/*
abstract class TaskEditor {
  Widget updateTaskWidget(BuildContext context, model, bool collapsed);
}

*/
class TaskModelRegistry {
  final Map<String, TaskDetails> tasks = HashMap();
  static TaskModelRegistry? _instance;

  TaskModelRegistry._internal();

  static TaskModelRegistry? registry() {
    _instance ??= TaskModelRegistry._internal();

    return _instance;
  }

  void addTask({required String identifier, required String definition, TaskEditor? editor, required TaskModelMapper mapper, required CreateNewInstance createNewInstance}) {
    tasks[identifier] = TaskDetails(identifier: identifier, definition: definition, editor: editor, mapper: mapper, createNewInstance: createNewInstance);
  }

  TaskDetails? getDetails(String identifier) {
    return tasks[identifier];
  }

  List<TaskDetails> getTasks() => tasks.values.toList();

  TaskModelMapper? getMapper(String? identifier) {
    if (identifier == null) throw Exception("No identifier specified");
    var taskDetails = tasks[identifier];
    if (taskDetails == null) return null;
    return taskDetails.mapper;
  }
}

