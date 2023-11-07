import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_dialog_widget.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogWithAssignmentResults {
  static Widget get(AppModel app, BuildContext context,
      {required String title,
      required String message,
      required List<String> buttonLabels,
      required List<VoidCallback> functions,
      List<AssignmentResultModel>? resultsPrevious,
      List<Widget>? extraFields}) {
    List<Widget> widgets = [];
    if ((resultsPrevious != null) && (resultsPrevious.isNotEmpty)) {
      widgets.add(Text(message));
      for (int i = 0; i < resultsPrevious.length; i++) {
        var result = resultsPrevious[i];
        widgets.add(Text("${result.key!}: ${result.value!}"));
      }
    }

    if ((extraFields != null) && (extraFields.isNotEmpty)) {
      widgets.addAll(extraFields);
    }

    Widget contents;
    if (widgets.isNotEmpty) {
      contents = Column(children: widgets);
    } else {
      contents = Text(message);
    }

    return flexibleDialog(app, context,
        title: title,
        child: contents,
        buttons: dialogButtons(app, context,
            labels: buttonLabels, functions: functions));
  }
}

class YesNoDialogWithAssignmentResults {
  static Widget get(AppModel app, BuildContext context,
      {required String title,
      required String message,
      List<AssignmentResultModel>? resultsPrevious,
      required VoidCallback yesFunction,
      required VoidCallback noFunction,
      List<Widget>? extraFields}) {
    return DialogWithAssignmentResults.get(
      app,
      context,
      title: title,
      message: message,
      resultsPrevious: resultsPrevious,
      buttonLabels: ['Cancel', 'Continue'],
      functions: [noFunction, yesFunction],
      extraFields: extraFields,
    );
  }
}

class YesNoIgnoreDialogWithAssignmentResults {
  static Widget get(AppModel app, BuildContext context,
      {required String title,
      required String message,
      List<AssignmentResultModel>? resultsPrevious,
      required VoidCallback yesFunction,
      required VoidCallback noFunction,
      List<Widget>? extraFields,
      String? yesLabel,
      String? noLabel}) {
    return DialogWithAssignmentResults.get(app, context,
        title: title,
        message: message,
        resultsPrevious: resultsPrevious,
        buttonLabels: ['Later', noLabel ?? 'Cancel', yesLabel ?? 'Continue'],
        functions: [
          () => Navigator.pop(context),
          () {
            noFunction();
            Navigator.pop(context);
          },
          () {
            yesFunction();
            Navigator.pop(context);
          },
        ],
        extraFields: extraFields);
  }
}
