import 'dart:collection';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';
import 'package:eliud_pkg_workflow/tools/task/task_entity.dart';
import 'package:flutter/cupertino.dart';

enum ExecutionResult { success, failure, decline, delay }

class TaskModelRegistry {
  final Map<String, TaskModelMapper> mappers = HashMap();
  static TaskModelRegistry _instance;

  TaskModelRegistry._internal() {
  }

  static TaskModelRegistry registry() {
    _instance ??= TaskModelRegistry._internal();

    return _instance;
  }

  void addMapper(String taskString, TaskModelMapper mapper) {
    mappers[taskString] = mapper;
  }

  TaskModelMapper getMapper(String taskString) {
    return mappers[taskString];
  }
}

abstract class TaskModelMapper {
  TaskModel fromEntity(TaskEntity entity);
  TaskModel fromEntityPlus(TaskEntity entity);
  TaskEntity fromMap(Map snap);
}

abstract class TaskModel {
  final String taskString;

  const TaskModel({this.taskString});

  TaskEntity toEntity({String appId});

  static TaskModel fromEntity(TaskEntity entity) {
    if (entity == null) return null;

    var mapper = TaskModelRegistry.registry().getMapper(entity.taskString);
    if (mapper != null) {
      return mapper.fromEntity(entity);
    }

    return null;
  }

  static Future<TaskModel> fromEntityPlus(TaskEntity entity, {String appId}) async {
    if (entity == null) return null;

    var mapper = TaskModelRegistry.registry().getMapper(entity.taskString);
    if (mapper != null) {
      return mapper.fromEntityPlus(entity);
    }

    return null;
  }

  /*
   * Execute the task. Is "isNewAssignment" then the assignment itself is required to be created. If not, then the assignment
   * needs to be updated (in case changes have been made to it).
   */
  ExecutionResult execute(BuildContext context, AssignmentModel assignmentModel, bool isNewAssignment);
}

/*
 Action. First we need to transform the current implementation of actions to be like the task implementation pattern:
 allow external packages to plugin an action. Then we need to add a way to actually execute the action when it's being clicked.
 (I'm guessing extend router or something)

 Then we can create a class for action "initiate workflow". Examples:
*/

/* Real example tasks are:
   ManualPayment:
     where execute opens dialog box with instructions and required details
     user can enter the details and has a few buttons Submit, Decline, Delay

   ChoiceOfPaymentsIncludingManual:
     where execute opens dialog box with various payment options to pay, then eventually actually making the payment

   ApprovePaymentAndShip:
     where execute invites the owner of the app gets the request to validate the payment and then ship the product

   RequestMembership:
     where execute opens a dialog box with "you want to become a member?". Yes means the next step in the workflow chain to be executed,
     which should be to request for a payment for the membership, or to activate the membership, depending on paid or free membership

   ApproveManualPayment
     where execute invites the owner of the app to approve the payment

   ActivateMembership
     where execute presents the request to activate membership to the owner

   Sometimes we actually have a tight coupling between the button and the task: some tasks can only be used within specific
   contexts. For example, when requesting friendship, the task needs to know who to make friendship with. So the RequestFriendship task
   assumes it runs in a context where a FriendshipBloc is available and where the state says which member to make friends with.
   The ManualPayment can have 2 implementations: FixedManualPayment, which can be configured with a specific amount, or
   ContextualManualPayment which also depends on and assume a PaymentBloc where it can get the amount from.
*/

/* Real example workflows are:
   manual_paid_membership : request_membership > manual_payment member (ManualPayment 20 GBP) > approve_manual_payment (ApproveManualPayment) > activate_membership (ActivateMembership)
   auto_membership: request_membership (RequestMembership) > activate_membership (ActivateMembership)
   buy: manual_or_other_payment (ChoiceOfPaymentsIncludingManual) > approve_and_ship
   become_friends: confirm_request_friendship > request_approval_friendship
 */

/* How it works:
   A button is clicked.
   If this is a specific context, like make a friend context, then a friendbloc with that friend is constructed.
   If the action behind the button is for example initiating a workflow, then the workflow is started.
   This in itself creates an assignment for the first
   It creates an instance Assignment then executes the first task in the workflow with the assignment.
   In this case the isNewAssignment is true instructing the task to store the assignment as a new assignment.

   The assignment does it's thing, in this case it asks for a confirmation to make friends.
   It could be that it gets some data from the context, eg. finds out if there's a friendbloc around. If not "exception"
   On success, ie. when the user confirms the task, then an assignment is created. In this example, this assignment is

   If the user confirms to make friends, it stores/creates the assignment as well as create a new assignment, i.e. for the next task of the workflow.
 */

class ExampleTaskModel1 extends TaskModel {
  final String extraParameter;

  ExampleTaskModel1({this.extraParameter}) : super(taskString: ExampleTaskEntity1.label);

  @override
  ExecutionResult execute(BuildContext context, AssignmentModel assignmentModel, bool isNewAssignment) {
    // open dialog box with some stuff
    throw UnimplementedError();
  }

  @override
  TaskEntity toEntity({String appId}) {
    return ExampleTaskEntity1();
  }

  static ExampleTaskModel1 fromEntity(ExampleTaskEntity1 entity) => ExampleTaskModel1(extraParameter: entity.extraParameter, );
  static ExampleTaskEntity1 fromMap(Map snap) => ExampleTaskEntity1(extraParameter: snap["extraParameter"]);
}

class ExampleTaskModel1Mapper implements TaskModelMapper {
  @override
  TaskModel fromEntity(TaskEntity entity) => ExampleTaskModel1.fromEntity(entity);

  @override
  TaskModel fromEntityPlus(TaskEntity entity) => fromEntity(entity);

  @override
  TaskEntity fromMap(Map map) => ExampleTaskModel1.fromMap(map);

}