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

import 'package:eliud_pkg_workflow/model/repository_export.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

/* 
 * AssignmentFirestore is the firestore implementation of AssignmentRepository
 */
class AssignmentFirestore implements AssignmentRepository {
  /* 
   * transform a map into an entity
   */
  @override
  AssignmentEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return AssignmentEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }

  /* 
   * add an entity to the repository
   */
  @override
  Future<AssignmentEntity> addEntity(
      String documentID, AssignmentEntity value) {
    return assignmentCollection
        .doc(documentID)
        .set(value.toDocument())
        .then((_) => value)
        .then((v) async {
      var newValue = await getEntity(documentID);
      if (newValue == null) {
        return value;
      } else {
        return newValue;
      }
    });
  }

  /* 
   * Update an entity
   */
  @override
  Future<AssignmentEntity> updateEntity(
      String documentID, AssignmentEntity value) {
    return assignmentCollection
        .doc(documentID)
        .update(value.toDocument())
        .then((_) => value)
        .then((v) async {
      var newValue = await getEntity(documentID);
      if (newValue == null) {
        return value;
      } else {
        return newValue;
      }
    });
  }

  /* 
   * Add a model to the repository
   */
  @override
  Future<AssignmentModel> add(AssignmentModel value) {
    return assignmentCollection
        .doc(value.documentID)
        .set(value
            .toEntity(appId: appId)
            .copyWith(
              timestamp: FieldValue.serverTimestamp(),
            )
            .toDocument())
        .then((_) => value)
        .then((v) async {
      var newValue = await get(value.documentID);
      if (newValue == null) {
        return value;
      } else {
        return newValue;
      }
    });
  }

  /* 
   * Delete a model
   */
  @override
  Future<void> delete(AssignmentModel value) {
    return assignmentCollection.doc(value.documentID).delete();
  }

  /* 
   * Update a model
   */
  @override
  Future<AssignmentModel> update(AssignmentModel value) {
    return assignmentCollection
        .doc(value.documentID)
        .update(value
            .toEntity(appId: appId)
            .copyWith(
              timestamp: FieldValue.serverTimestamp(),
            )
            .toDocument())
        .then((_) => value)
        .then((v) async {
      var newValue = await get(value.documentID);
      if (newValue == null) {
        return value;
      } else {
        return newValue;
      }
    });
  }

  Future<AssignmentModel?> _populateDoc(DocumentSnapshot value) async {
    return AssignmentModel.fromEntity(
        value.id, AssignmentEntity.fromMap(value.data()));
  }

  Future<AssignmentModel?> _populateDocPlus(DocumentSnapshot value) async {
    return AssignmentModel.fromEntityPlus(
        value.id, AssignmentEntity.fromMap(value.data()),
        appId: appId);
  }

  /* 
   * Retrieve an entity from the repository with id
   */
  @override
  Future<AssignmentEntity?> getEntity(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = assignmentCollection.doc(id);
      var doc = await collection.get();
      return AssignmentEntity.fromMap(doc.data());
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving Assignment with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  /* 
   * Retrieve an model from the repository with id
   */
  @override
  Future<AssignmentModel?> get(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = assignmentCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving Assignment with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  /* 
   * Listen to the repository using a query. Retrieve models
   */
  @override
  StreamSubscription<List<AssignmentModel?>> listen(
      AssignmentModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<AssignmentModel?>> stream;
    stream = getQuery(getCollection(),
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .snapshots()
//  see comment listen(...) above
//  stream = getQuery(assignmentCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDoc(doc)).toList());
    });

    return stream.listen((listOfAssignmentModels) {
      trigger(listOfAssignmentModels);
    });
  }

  /* 
   * Listen to the repository using a query. Retrieve models and linked models
   */
  @override
  StreamSubscription<List<AssignmentModel?>> listenWithDetails(
      AssignmentModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<AssignmentModel?>> stream;
    stream = getQuery(getCollection(),
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .snapshots()
//  see comment listen(...) above
//  stream = getQuery(assignmentCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfAssignmentModels) {
      trigger(listOfAssignmentModels);
    });
  }

  /* 
   * Listen to 1 document in the repository
   */
  @override
  StreamSubscription<AssignmentModel?> listenTo(
      String documentId, AssignmentChanged changed,
      {AssignmentErrorHandler? errorHandler}) {
    var stream =
        assignmentCollection.doc(documentId).snapshots().asyncMap((data) {
      return _populateDocPlus(data);
    });
    var theStream = stream.listen((value) {
      changed(value);
    });
    theStream.onError((theException, theStacktrace) {
      if (errorHandler != null) {
        errorHandler(theException, theStacktrace);
      }
    });
    return theStream;
  }

  /* 
   * Retrieve values/models from the repository
   */
  @override
  Stream<List<AssignmentModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<AssignmentModel?>> values = getQuery(assignmentCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .snapshots()
        .asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  /* 
   * Retrieve values/models, including linked models, from the repository
   */
  @override
  Stream<List<AssignmentModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<AssignmentModel?>> values = getQuery(assignmentCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .snapshots()
        .asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  /* 
   * Retrieve values/models from the repository
   */
  @override
  Future<List<AssignmentModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<AssignmentModel?> values = await getQuery(assignmentCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .get()
        .then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  /* 
   * Retrieve values/models, including linked models, from the repository
   */
  @override
  Future<List<AssignmentModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<AssignmentModel?> values = await getQuery(assignmentCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .get()
        .then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  /* 
   * Flush the repository
   */
  @override
  void flush() {}

  /* 
   * Delete all entries in the repository
   */
  @override
  Future<void> deleteAll() {
    return assignmentCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  /* 
   * Retrieve the subcollection of this repository
   */
  @override
  dynamic getSubCollection(String documentId, String name) {
    return assignmentCollection.doc(documentId).collection(name);
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  }

  /* 
   * change 1 a fieldvalue for 1 document  
   */
  @override
  Future<AssignmentModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return assignmentCollection
        .doc(documentId)
        .update({fieldName: change}).then((v) => get(documentId));
  }

  final String appId;
  AssignmentFirestore(this.getCollection, this.appId)
      : assignmentCollection = getCollection();

  final CollectionReference assignmentCollection;
  final GetCollection getCollection;
}
