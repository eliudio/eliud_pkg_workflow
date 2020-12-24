/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_workflow/model/assignment_repository.dart';


import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';



import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_core/tools/js_firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class AssignmentJsFirestore implements AssignmentRepository {
  Future<AssignmentModel> add(AssignmentModel value) {
    return assignmentCollection.doc(value.documentID)
        .set(value.toEntity().copyWith(timestamp : FieldValue.serverTimestamp(), ).toDocument())
        .then((_) => value).then((v) => get(value.documentID));
  }

  Future<void> delete(AssignmentModel value) {
    return assignmentCollection.doc(value.documentID).delete();
  }

  Future<AssignmentModel> update(AssignmentModel value) {
    return assignmentCollection.doc(value.documentID)
        .update(data: value.toEntity().copyWith(timestamp : FieldValue.serverTimestamp(), ).toDocument())
        .then((_) => value).then((v) => get(value.documentID));
  }

  AssignmentModel _populateDoc(DocumentSnapshot value) {
    return AssignmentModel.fromEntity(value.id, AssignmentEntity.fromMap(value.data()));
  }

  Future<AssignmentModel> _populateDocPlus(DocumentSnapshot value) async {
    return AssignmentModel.fromEntityPlus(value.id, AssignmentEntity.fromMap(value.data()), );
  }

  Future<AssignmentModel> get(String id) {
    return assignmentCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<AssignmentModel>> listen(AssignmentModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    var stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .map((data) {
        Iterable<AssignmentModel> assignments  = data.docs.map((doc) {
          AssignmentModel value = _populateDoc(doc);
          return value;
        }).toList();
        return assignments;
      });
    } else {
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) {
        Iterable<AssignmentModel> assignments  = data.docs.map((doc) {
          AssignmentModel value = _populateDoc(doc);
          return value;
        }).toList();
        return assignments;
      });
    }
    return stream.listen((listOfAssignmentModels) {
      trigger(listOfAssignmentModels);
    });
  }

  StreamSubscription<List<AssignmentModel>> listenWithDetails(AssignmentModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    var stream;
    if (orderBy == null) {
      // If we use assignmentCollection here, then the second subscription fails
      stream = getCollection().onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      // If we use assignmentCollection here, then the second subscription fails
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfAssignmentModels) {
      trigger(listOfAssignmentModels);
    });
  }

  Stream<List<AssignmentModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<AssignmentModel>> _values = getQuery(assignmentCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, )
      .onSnapshot
      .map((data) { 
        return data.docs.map((doc) {
          lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<AssignmentModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<AssignmentModel>> _values = getQuery(assignmentCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, )
      .onSnapshot
      .asyncMap((data) {
        return Future.wait(data.docs.map((doc) { 
          lastDoc = doc;
          return _populateDocPlus(doc);
        }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  @override
  Future<List<AssignmentModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<AssignmentModel> _values = await getQuery(assignmentCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, ).get().then((value) {
      var list = value.docs;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  @override
  Future<List<AssignmentModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<AssignmentModel> _values = await getQuery(assignmentCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, ).get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {  
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return assignmentCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => assignmentCollection.doc(element.id).delete()));
  }
  
  dynamic getSubCollection(String documentId, String name) {
    return assignmentCollection.doc(documentId).collection(name);
  }

  CollectionReference getCollection() => firestore().collection('assignment');

  AssignmentJsFirestore();

  final CollectionReference assignmentCollection = firestore().collection('assignment');
}
