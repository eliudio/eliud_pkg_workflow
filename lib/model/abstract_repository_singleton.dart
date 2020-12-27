/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/abstract_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/assignment_repository.dart';
import '../model/assignment_result_repository.dart';
import '../model/workflow_repository.dart';
import '../model/workflow_task_repository.dart';
import 'package:eliud_core/core/access/bloc/user_repository.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

AssignmentRepository assignmentRepository({ String appId }) => AbstractRepositorySingleton.singleton.assignmentRepository(appId);
WorkflowRepository workflowRepository({ String appId }) => AbstractRepositorySingleton.singleton.workflowRepository(appId);

abstract class AbstractRepositorySingleton {
  static AbstractRepositorySingleton singleton;

  AssignmentRepository assignmentRepository(String appId);
  WorkflowRepository workflowRepository(String appId);

  void flush(String appId) {
    assignmentRepository(appId).flush();
  }
}
