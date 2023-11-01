import 'package:eliud_pkg_workflow/tools/task/task_entity.dart';
import 'package:eliud_pkg_workflow/tools/task/task_model.dart';
import 'package:eliud_pkg_workflow/tools/task/task_model_mapper.dart';

import 'example_task_entity_1.dart';
import 'example_task_model_1.dart';

class ExampleTaskModel1Mapper implements TaskModelMapper {
  @override
  TaskModel fromEntity(TaskEntity entity) =>
      ExampleTaskModel1.fromEntity(entity as ExampleTaskEntity1);

  @override
  TaskModel fromEntityPlus(TaskEntity entity) => fromEntity(entity);

  @override
  TaskEntity fromMap(Map map) => ExampleTaskModel1.fromMap(map);
}
