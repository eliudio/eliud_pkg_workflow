/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/



import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';


import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef WorkflowModelTrigger(List<WorkflowModel?> list);
typedef WorkflowChanged(WorkflowModel? value);
typedef WorkflowErrorHandler(o, e);

abstract class WorkflowRepository extends RepositoryBase<WorkflowModel, WorkflowEntity> {
  Future<WorkflowEntity> addEntity(String documentID, WorkflowEntity value);
  Future<WorkflowEntity> updateEntity(String documentID, WorkflowEntity value);
  Future<WorkflowModel> add(WorkflowModel value);
  Future<void> delete(WorkflowModel value);
  Future<WorkflowModel?> get(String? id, { Function(Exception)? onError });
  Future<WorkflowModel> update(WorkflowModel value);

  Stream<List<WorkflowModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<WorkflowModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<WorkflowModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<WorkflowModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<WorkflowModel?>> listen(WorkflowModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<WorkflowModel?>> listenWithDetails(WorkflowModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<WorkflowModel?> listenTo(String documentId, WorkflowChanged changed, {WorkflowErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<WorkflowModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


