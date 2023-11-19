import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';
import 'package:eliud_pkg_workflow/model/workflow_notification_model.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_model.dart';

enum Responsible { currentMember, owner, first, previous }

class DetermineMemberHelper {
  static Future<String?> determineMemberWithWorkflowNotificationAddressee(
      WorkflowNotificationAddressee? responsible,
      AppModel app,
      MemberModel member,
      AssignmentModel currentAssignment) async {
    Responsible? newResponsible;
    switch (responsible) {
      case WorkflowNotificationAddressee.currentMember:
        newResponsible = Responsible.currentMember;
        break;
      case WorkflowNotificationAddressee.owner:
        newResponsible = Responsible.owner;
        break;
      case WorkflowNotificationAddressee.first:
        newResponsible = Responsible.first;
        break;
      case WorkflowNotificationAddressee.previous:
        newResponsible = Responsible.previous;
        break;
      case WorkflowNotificationAddressee.unknown:
        break;
      case null:
        break;
    }
    return determineMember(newResponsible, app, member, currentAssignment);
  }

  static Future<String?> determineMemberWithWorkflowTaskResponsible(
      WorkflowTaskResponsible? responsible,
      AppModel app,
      MemberModel member,
      AssignmentModel currentAssignment) async {
    Responsible? newResponsible;
    switch (responsible) {
      case WorkflowTaskResponsible.currentMember:
        newResponsible = Responsible.currentMember;
        break;
      case WorkflowTaskResponsible.owner:
        newResponsible = Responsible.owner;
        break;
      case WorkflowTaskResponsible.first:
        newResponsible = Responsible.first;
        break;
      case WorkflowTaskResponsible.previous:
        newResponsible = Responsible.previous;
        break;
      case WorkflowTaskResponsible.unknown:
        break;
      case null:
        break;
    }
    return determineMember(newResponsible, app, member, currentAssignment);
  }

  static Future<String?> determineMember(Responsible? responsible, AppModel app,
      MemberModel member, AssignmentModel currentAssignment) async {
    switch (responsible) {
      case Responsible.currentMember:
        return member.documentID;
      case Responsible.owner:
        return app.ownerID;
      case Responsible.first:
        var findAssignment = currentAssignment;
        String? assigneeId;
        while (findAssignment.triggeredById != null) {
          assigneeId = findAssignment.assigneeId;
          var found = await (assignmentRepository(appId: app.documentID)!
              .get(findAssignment.triggeredById));
          if (found != null) {
            findAssignment = found;
          } else {
            return null;
          }
        }
        return assigneeId;
      case Responsible.previous:
        if (currentAssignment.triggeredById != null) {
          var triggeredBy = await (assignmentRepository(appId: app.documentID)!
              .get(currentAssignment.triggeredById));
          if (triggeredBy != null) {
            return triggeredBy.assigneeId;
          } else {
            return null;
          }
        }
        break;
      case null:
        break;
    }
    return null;
  }
}
