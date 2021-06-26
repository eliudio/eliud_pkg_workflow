import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogWithAssignmentResults {
  static Widget get(BuildContext context,
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
        widgets.add(Text(result.key! + ": " + result.value!));
      }
    }

    if ((extraFields != null) && (extraFields.isNotEmpty)) {
      widgets.addAll(extraFields);
    }

    var contents;
    if (widgets.length > 0) {
      contents = Column(children: widgets);
    } else {
      contents = Text(message);
    }

    return StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogWidgetStyle()
        .flexibleDialog(context,
            title: title,
            child: contents,
            buttons: StyleRegistry.registry()
                .styleWithContext(context)
                .frontEndStyle()
                .buttonStyle()
                .dialogButtons(context,
                    labels: buttonLabels, functions: functions));
  }
}

class YesNoDialogWithAssignmentResults {
  static Widget get(BuildContext context,
      {
      required String title,
      required String message,
      List<AssignmentResultModel>? resultsPrevious,
      required VoidCallback yesFunction,
      required VoidCallback noFunction,
      List<Widget>? extraFields}) {
    return DialogWithAssignmentResults.get(context,
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
  static Widget get(BuildContext context,
      {required String title,
      required String message,
        List<AssignmentResultModel>? resultsPrevious,
      required VoidCallback yesFunction,
      required VoidCallback noFunction,
        List<Widget>? extraFields,
      String? yesLabel,
        String? noLabel}) {
    return DialogWithAssignmentResults.get(context,
        title: title,
        message: message,
        resultsPrevious: resultsPrevious,
        buttonLabels: [
          'Later',
          noLabel != null ? noLabel : 'Cancel',
          yesLabel != null ? yesLabel : 'Continue'
        ],
        functions: [
              () => Navigator.pop(context),
              () {
            Navigator.pop(context);
            noFunction();
          },
              () {
            Navigator.pop(context);
            yesFunction();
          },
        ],
        extraFields: extraFields);
  }
}
