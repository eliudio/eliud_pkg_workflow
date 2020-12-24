/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'dart:collection';
import '../model/assignment_firestore.dart';
import '../model/assignment_repository.dart';
import '../model/assignment_cache.dart';
import '../model/assignment_result_repository.dart';
import '../model/assignment_result_cache.dart';
import '../model/workflow_firestore.dart';
import '../model/workflow_repository.dart';
import '../model/workflow_cache.dart';
import '../model/workflow_task_repository.dart';
import '../model/workflow_task_cache.dart';

import '../model/assignment_model.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
    var _assignmentRepository = AssignmentCache(AssignmentFirestore());
    var _workflowRepository = HashMap<String, WorkflowRepository>();

    AssignmentRepository assignmentRepository() {
      return _assignmentRepository;
    }
    WorkflowRepository workflowRepository(String appId) {
      if (_workflowRepository[appId] == null) _workflowRepository[appId] = WorkflowCache(WorkflowFirestore(appRepository().getSubCollection(appId, 'workflow'), appId));
      return _workflowRepository[appId];
    }

}
