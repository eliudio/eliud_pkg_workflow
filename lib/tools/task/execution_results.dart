import 'package:eliud_pkg_notifications/platform/platform.dart';
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
import 'package:eliud_pkg_workflow/tools/helper/deterimine_member_helper.dart';
import 'package:eliud_pkg_workflow/tools/task/task_entity.dart';
import 'package:flutter/cupertino.dart';

enum ExecutionStatus { success, failure, decline, delay }

class ExecutionResults {
  final ExecutionStatus status;
  final List<AssignmentResultModel>? results;

  ExecutionResults(this.status, {this.results});
}

