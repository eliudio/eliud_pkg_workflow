/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_notification_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow/model/entity_export.dart';


import 'package:eliud_pkg_workflow/model/workflow_notification_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum WorkflowNotificationAddressee {
  CurrentMember, Owner, First, Previous, Unknown
}


WorkflowNotificationAddressee toWorkflowNotificationAddressee(int? index) {
  switch (index) {
    case 0: return WorkflowNotificationAddressee.CurrentMember;
    case 1: return WorkflowNotificationAddressee.Owner;
    case 2: return WorkflowNotificationAddressee.First;
    case 3: return WorkflowNotificationAddressee.Previous;
  }
  return WorkflowNotificationAddressee.Unknown;
}


class WorkflowNotificationModel {
  static const String packageName = 'eliud_pkg_workflow';
  static const String id = 'WorkflowNotification';

  String? message;

  // Who's to be notified after completing the  to do this task? The workflow logic will use the current member, the owner of the app, or the initiator of the workflow as the assignee of the assignment
  WorkflowNotificationAddressee? addressee;

  WorkflowNotificationModel({this.message, this.addressee, })  {
  }

  WorkflowNotificationModel copyWith({String? message, WorkflowNotificationAddressee? addressee, }) {
    return WorkflowNotificationModel(message: message ?? this.message, addressee: addressee ?? this.addressee, );
  }

  @override
  int get hashCode => message.hashCode ^ addressee.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is WorkflowNotificationModel &&
          runtimeType == other.runtimeType && 
          message == other.message &&
          addressee == other.addressee;

  @override
  String toString() {
    return 'WorkflowNotificationModel{message: $message, addressee: $addressee}';
  }

  WorkflowNotificationEntity toEntity({String? appId, Set<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
    }
    return WorkflowNotificationEntity(
          message: (message != null) ? message : null, 
          addressee: (addressee != null) ? addressee!.index : null, 
    );
  }

  static Future<WorkflowNotificationModel?> fromEntity(WorkflowNotificationEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return WorkflowNotificationModel(
          message: entity.message, 
          addressee: toWorkflowNotificationAddressee(entity.addressee), 
    );
  }

  static Future<WorkflowNotificationModel?> fromEntityPlus(WorkflowNotificationEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return WorkflowNotificationModel(
          message: entity.message, 
          addressee: toWorkflowNotificationAddressee(entity.addressee), 
    );
  }

}

