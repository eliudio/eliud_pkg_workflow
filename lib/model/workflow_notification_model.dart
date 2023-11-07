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

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_pkg_workflow/model/entity_export.dart';

import 'package:eliud_pkg_workflow/model/workflow_notification_entity.dart';

enum WorkflowNotificationAddressee {
  currentMember,
  owner,
  first,
  previous,
  unknown
}

WorkflowNotificationAddressee toWorkflowNotificationAddressee(int? index) {
  switch (index) {
    case 0:
      return WorkflowNotificationAddressee.currentMember;
    case 1:
      return WorkflowNotificationAddressee.owner;
    case 2:
      return WorkflowNotificationAddressee.first;
    case 3:
      return WorkflowNotificationAddressee.previous;
  }
  return WorkflowNotificationAddressee.unknown;
}

class WorkflowNotificationModel {
  static const String packageName = 'eliud_pkg_workflow';
  static const String id = 'workflowNotifications';

  String? message;

  // Who's to be notified after completing the  to do this task? The workflow logic will use the current member, the owner of the app, or the initiator of the workflow as the assignee of the assignment
  WorkflowNotificationAddressee? addressee;

  WorkflowNotificationModel({
    this.message,
    this.addressee,
  });

  WorkflowNotificationModel copyWith({
    String? message,
    WorkflowNotificationAddressee? addressee,
  }) {
    return WorkflowNotificationModel(
      message: message ?? this.message,
      addressee: addressee ?? this.addressee,
    );
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

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    return referencesCollector;
  }

  WorkflowNotificationEntity toEntity({String? appId}) {
    return WorkflowNotificationEntity(
      message: (message != null) ? message : null,
      addressee: (addressee != null) ? addressee!.index : null,
    );
  }

  static Future<WorkflowNotificationModel?> fromEntity(
      WorkflowNotificationEntity? entity) async {
    if (entity == null) return null;
    return WorkflowNotificationModel(
      message: entity.message,
      addressee: toWorkflowNotificationAddressee(entity.addressee),
    );
  }

  static Future<WorkflowNotificationModel?> fromEntityPlus(
      WorkflowNotificationEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return WorkflowNotificationModel(
      message: entity.message,
      addressee: toWorkflowNotificationAddressee(entity.addressee),
    );
  }
}
