import 'package:eliud_pkg_workflow/model/assignment_model.dart';

class AssignmentHelper {
  static String? getResultFor(AssignmentModel assignmentModel, String key) {
    if (assignmentModel.resultsCurrent == null) return null;
    for (int i = 0; i < assignmentModel.resultsCurrent!.length; i++) {
      if (assignmentModel.resultsCurrent![i].key == key) {
        return assignmentModel.resultsCurrent![i].value;
      }
    }
    return null;
  }
}
