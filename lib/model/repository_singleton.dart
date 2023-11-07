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
import '../model/assignment_view_firestore.dart';
import '../model/assignment_view_repository.dart';
import '../model/assignment_view_cache.dart';
import '../model/workflow_firestore.dart';
import '../model/workflow_repository.dart';
import '../model/workflow_cache.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
  final _assignmentRepository = HashMap<String, AssignmentRepository>();
  final _assignmentViewRepository = HashMap<String, AssignmentViewRepository>();
  final _workflowRepository = HashMap<String, WorkflowRepository>();

  @override
  AssignmentRepository? assignmentRepository(String? appId) {
    if ((appId != null) && (_assignmentRepository[appId] == null)) {
      _assignmentRepository[appId] = AssignmentCache(AssignmentFirestore(
          () => appRepository()!.getSubCollection(appId, 'assignment'), appId));
    }
    return _assignmentRepository[appId];
  }

  @override
  AssignmentViewRepository? assignmentViewRepository(String? appId) {
    if ((appId != null) && (_assignmentViewRepository[appId] == null)) {
      _assignmentViewRepository[appId] = AssignmentViewCache(
          AssignmentViewFirestore(
              () => appRepository()!.getSubCollection(appId, 'assignmentview'),
              appId));
    }
    return _assignmentViewRepository[appId];
  }

  @override
  WorkflowRepository? workflowRepository(String? appId) {
    if ((appId != null) && (_workflowRepository[appId] == null)) {
      _workflowRepository[appId] = WorkflowCache(WorkflowFirestore(
          () => appRepository()!.getSubCollection(appId, 'workflow'), appId));
    }
    return _workflowRepository[appId];
  }
}
