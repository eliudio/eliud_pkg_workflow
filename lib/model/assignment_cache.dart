/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_repository.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_pkg_workflow/model/cache_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

class AssignmentCache implements AssignmentRepository {

  final AssignmentRepository reference;
  final Map<String, AssignmentModel> fullCache = Map();

  AssignmentCache(this.reference);

  Future<AssignmentModel> add(AssignmentModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(AssignmentModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<AssignmentModel> get(String id){
    AssignmentModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<AssignmentModel> update(AssignmentModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<AssignmentModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    return reference.values(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel);
  }

  @override
  Stream<List<AssignmentModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    return reference.valuesWithDetails(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, );
  }

  @override
  Future<List<AssignmentModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    return await reference.valuesList(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, );
  }
  
  @override
  Future<List<AssignmentModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel}) async {
    return await reference.valuesListWithDetails(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, );
  }

  void flush() {
    fullCache.clear();
  }
  
  String timeStampToString(dynamic timeStamp) {
    return reference.timeStampToString(timeStamp);
  } 

  dynamic getSubCollection(String documentId, String name) {
    return reference.getSubCollection(documentId, name);
  }


  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<AssignmentModel>> listen(trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel}) {
    return reference.listen(trigger, currentMember: currentMember, orderBy: orderBy, descending: descending, privilegeLevel: privilegeLevel, );
  }

  @override
  StreamSubscription<List<AssignmentModel>> listenWithDetails(trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel}) {
    return reference.listenWithDetails(trigger, currentMember: currentMember, orderBy: orderBy, descending: descending, privilegeLevel: privilegeLevel, );
  }

  @override
  StreamSubscription<AssignmentModel> listenTo(String documentId, changed) {
    reference.listenTo(documentId, changed);
  }

  static Future<AssignmentModel> refreshRelations(AssignmentModel model) async {

    MemberModel reporterHolder;
    if (model.reporter != null) {
      try {
        await memberRepository().get(model.reporter.documentID).then((val) {
          reporterHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    MemberModel assigneeHolder;
    if (model.assignee != null) {
      try {
        await memberRepository().get(model.assignee.documentID).then((val) {
          assigneeHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    WorkflowModel workflowHolder;
    if (model.workflow != null) {
      try {
        await workflowRepository(appId: model.workflow.appId).get(model.workflow.documentID).then((val) {
          workflowHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    AssignmentModel triggeredByHolder;
    if (model.triggeredBy != null) {
      try {
        await assignmentRepository(appId: model.triggeredBy.appId).get(model.triggeredBy.documentID).then((val) {
          triggeredByHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<AssignmentResultModel> resultsHolder = List<AssignmentResultModel>.from(await Future.wait(await model.results.map((element) async {
      return await AssignmentResultCache.refreshRelations(element);
    }))).toList();

    return model.copyWith(
        reporter: reporterHolder,

        assignee: assigneeHolder,

        workflow: workflowHolder,

        triggeredBy: triggeredByHolder,

        results: resultsHolder,


    );
  }

}

