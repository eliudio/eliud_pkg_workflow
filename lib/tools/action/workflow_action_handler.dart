import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/navigate/router.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_model.dart';
import 'package:eliud_pkg_workflow/tools/task/task_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:eliud_core/tools/random.dart';

class WorkflowActionHandler extends PackageActionHandler {
  @override
  Future<void> navigateTo(BuildContext context, ActionModel action, {Map<String, dynamic>? parameters}) async {
    if (action is WorkflowActionModel) {
      executeWorkflow(context, action);
    }
  }

  static void executeWorkflow(BuildContext context, WorkflowActionModel action, {FinaliseWorkflow? finaliseWorkflow}) {
    var app = action.app;
    var accessState = AccessBloc.getState(context);
    if (accessState is AccessDetermined) {
      var workflowModel = action.workflow!;
      var member = accessState.getMember();
      if (member != null) {
        var memberId = member.documentID;
        if ((workflowModel.workflowTask != null) &&
            (workflowModel.workflowTask!.length > 0)) {
          var firstWorkflowTask = workflowModel.workflowTask![0];
          var firstTask = firstWorkflowTask.task!;
          var assignment = AssignmentModel(
            documentID: newRandomKey(),
            appId: app.documentID!,
            reporterId: accessState.getMember()!.documentID!,
            assigneeId: memberId,
            task: firstTask,
            workflow: workflowModel,
            timestamp: null,
            triggeredById: null,
            workflowTaskSeqNumber: firstWorkflowTask.seqNumber,
            resultsPrevious: null,
            confirmMessage: firstWorkflowTask.confirmMessage,
            rejectMessage: firstWorkflowTask.rejectMessage,
            status: AssignmentStatus.Open,
          );
          firstTask.callExecute(
              app, context, memberId!, assignment, true, finaliseWorkflow: finaliseWorkflow);
        } else {
          throw Exception("No tasks in workflow");
        }
      } else {
        throw Exception("No member logged on. Can't execute workflow");
      }
    } else {
      throw Exception("AccessState is not AccessDetermined. Can't execute workflow");
    }

  }
}


