import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/access/state/access_determined.dart';
import 'package:eliud_core/core/navigate/router.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:eliud_pkg_workflow_model/model/assignment_model.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_model.dart';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_pkg_workflow_model/tools/task/task_model.dart';
import 'package:flutter/cupertino.dart';

class WorkflowActionHandler extends PackageActionHandler {
  static String finaliseWorkflow = 'finaliseworkflow';

  @override
  Future<void> navigateTo(BuildContext context, ActionModel action,
      {Map<String, dynamic>? parameters}) async {
    if (action is WorkflowActionModel) {
      if (parameters != null) {
        var something = parameters[finaliseWorkflow];
        if (something is FinaliseWorkflow) {
          executeWorkflow(context, action, finaliseWorkflow: something);
        } else {
          executeWorkflow(context, action);
        }
      } else {
        executeWorkflow(context, action);
      }
    }
  }

  static void executeWorkflow(BuildContext context, WorkflowActionModel action,
      {FinaliseWorkflow? finaliseWorkflow}) {
    var app = action.app;
    var accessState = AccessBloc.getState(context);
    if (accessState is AccessDetermined) {
      var workflowModel = action.workflow!;
      var member = accessState.getMember();
      if (member != null) {
        var memberId = member.documentID;
        if ((workflowModel.workflowTask != null) &&
            (workflowModel.workflowTask!.isNotEmpty)) {
          var firstWorkflowTask = workflowModel.workflowTask![0];
          var firstTask = firstWorkflowTask.task!;
          var assignment = AssignmentModel(
            documentID: newRandomKey(),
            appId: app.documentID,
            reporterId: accessState.getMember()!.documentID,
            assigneeId: memberId,
            task: firstTask,
            workflow: workflowModel,
            timestamp: null,
            triggeredById: null,
            workflowTaskSeqNumber: firstWorkflowTask.seqNumber,
            resultsPrevious: null,
            confirmMessage: firstWorkflowTask.confirmMessage,
            rejectMessage: firstWorkflowTask.rejectMessage,
            status: AssignmentStatus.open,
          );
          firstTask.callExecute(app, context, memberId, assignment, true,
              finaliseWorkflow: finaliseWorkflow);
        } else {
          throw Exception("No tasks in workflow");
        }
      } else {
        throw Exception("No member logged on. Can't execute workflow");
      }
    } else {
      throw Exception(
          "AccessState is not AccessDetermined. Can't execute workflow");
    }
  }
}
