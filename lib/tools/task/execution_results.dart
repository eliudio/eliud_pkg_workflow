import 'package:eliud_pkg_workflow/model/assignment_result_model.dart';

enum ExecutionStatus { success, failure, decline, delay }

class ExecutionResults {
  final ExecutionStatus status;
  final List<AssignmentResultModel>? results;

  ExecutionResults(this.status, {this.results});
}

