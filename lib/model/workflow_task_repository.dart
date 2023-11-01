/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_task_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/



import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';


import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef WorkflowTaskModelTrigger(List<WorkflowTaskModel?> list);
typedef WorkflowTaskChanged(WorkflowTaskModel? value);
typedef WorkflowTaskErrorHandler(o, e);

abstract class WorkflowTaskRepository extends RepositoryBase<WorkflowTaskModel, WorkflowTaskEntity> {
  Future<WorkflowTaskEntity> addEntity(String documentID, WorkflowTaskEntity value);
  Future<WorkflowTaskEntity> updateEntity(String documentID, WorkflowTaskEntity value);
  Future<WorkflowTaskModel> add(WorkflowTaskModel value);
  Future<void> delete(WorkflowTaskModel value);
  Future<WorkflowTaskModel?> get(String? id, { Function(Exception)? onError });
  Future<WorkflowTaskModel> update(WorkflowTaskModel value);

  Stream<List<WorkflowTaskModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<WorkflowTaskModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<WorkflowTaskModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<WorkflowTaskModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<WorkflowTaskModel?>> listen(WorkflowTaskModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<WorkflowTaskModel?>> listenWithDetails(WorkflowTaskModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<WorkflowTaskModel?> listenTo(String documentId, WorkflowTaskChanged changed, {WorkflowTaskErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<WorkflowTaskModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


