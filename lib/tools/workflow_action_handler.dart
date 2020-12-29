import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/navigate/router.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';
import 'package:eliud_pkg_workflow/model/workflow_firestore.dart';
import 'package:eliud_pkg_workflow/model/workflow_model.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:eliud_core/tools/random.dart';

class WorkflowActionHandler extends PackageActionHandler {
  @override
  Future<void> navigateTo(BuildContext context, ActionModel action, {Map<String, Object> parameters}) async {
    if (action is WorkflowAction) {
      var accessState = AccessBloc.getState(context);
      if (accessState is LoggedIn) {
        // workflow only available for logged in members
        var workflowModel = action.workflow;
        if ((workflowModel.workflowTask != null) && (workflowModel.workflowTask.length > 0)) {
          var firstTask = workflowModel.workflowTask[0].task;
          var assignment = AssignmentModel(
              documentID:newRandomKey(),
              appId: action.appID,
              reporter: accessState.member,
              assigneeId: accessState.member.documentID,
              task: firstTask,
              workflow: workflowModel,
              timestamp: null,
              triggeredById: null,
              workflowTaskSeqNumber: action.workflow.workflowTask[0].seqNumber,
              resultsPrevious: null,
              status: AssignmentStatus.Open,
          );
          firstTask.callExecute(context, assignment, true);
        } else {
          // no tasks in workflow
        }
      }
    }
  }
}