import 'dart:collection';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_model.dart';
import 'package:eliud_pkg_workflow/model/workflow_notification_model.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_model.dart';
import 'package:eliud_pkg_workflow/tools/task/task_entity.dart';
import 'package:flutter/cupertino.dart';



enum Responsible {
  CurrentMember, Owner, First, Previous
}

class DetermineMemberHelper {
  static Future<String> determineMemberWithWorkflowNotificationAddressee(WorkflowNotificationAddressee responsible, AppModel app, MemberModel member, AssignmentModel currentAssignment) async {
    Responsible newResponsible;
    switch (responsible) {
      case WorkflowNotificationAddressee.CurrentMember: newResponsible = Responsible.CurrentMember; break;
      case WorkflowNotificationAddressee.Owner: newResponsible = Responsible.Owner; break;
      case WorkflowNotificationAddressee.First: newResponsible = Responsible.First; break;
      case WorkflowNotificationAddressee.Previous: newResponsible = Responsible.Previous; break;
    }
    return determineMember(newResponsible, app, member, currentAssignment);
  }

  static Future<String> determineMemberWithWorkflowTaskResponsible(WorkflowTaskResponsible responsible, AppModel app, MemberModel member, AssignmentModel currentAssignment) async {
    Responsible newResponsible;
    switch (responsible) {
      case WorkflowTaskResponsible.CurrentMember: newResponsible = Responsible.CurrentMember; break;
      case WorkflowTaskResponsible.Owner: newResponsible = Responsible.Owner; break;
      case WorkflowTaskResponsible.First: newResponsible = Responsible.First; break;
      case WorkflowTaskResponsible.Previous: newResponsible = Responsible.Previous; break;
    }
    return determineMember(newResponsible, app, member, currentAssignment);
  }

  static Future<String> determineMember(Responsible responsible, AppModel app, MemberModel member, AssignmentModel currentAssignment) async {
    switch (responsible) {
      case Responsible.CurrentMember:
        return member.documentID;
      case Responsible.Owner:
        return app.ownerID;
      case Responsible.First:
        var findAssignment = currentAssignment;
        var assigneeId;
        while (findAssignment.triggeredById != null) {
          assigneeId = findAssignment.assigneeId;
          findAssignment = await assignmentRepository(appId: app.documentID).get(findAssignment.triggeredById);
        }
        return assigneeId;
      case Responsible.Previous:
        if (currentAssignment.triggeredById != null) {
          var triggeredBy = await assignmentRepository(appId: app.documentID).get(currentAssignment.triggeredById);
          return triggeredBy.assigneeId;
        }
        break;
    }
    return null;
  }
}