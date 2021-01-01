import 'package:eliud_core/tools/widgets/dialog_helper.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogWithAssignmentResults extends StatefulWidget {
  final String title;
  final String message;
  final List<AssignmentResultModel> resultsPrevious;
  final List<String> buttonLabels;
  final List<Function> functions;
  final List<Widget> extraFields;

  DialogWithAssignmentResults(
      {Key key,
      this.title,
      this.message,
      this.buttonLabels,
      this.functions,
      this.resultsPrevious,
      this.extraFields})
      : super(key: key);

  @override
  _DialogWithAssignmentResultsState createState() =>
      _DialogWithAssignmentResultsState();
}

class _DialogWithAssignmentResultsState
    extends State<DialogWithAssignmentResults> {
  final DialogStateHelper dialogHelper = DialogStateHelper();

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        title: widget.title,
        contents: contents(context),
        buttons: dialogHelper.getButtons(
            context, widget.buttonLabels, widget.functions));
  }

  Widget contents(BuildContext context) {
    List<Widget> widgets = [];
    if ((widget.resultsPrevious != null) &&
        (widget.resultsPrevious.isNotEmpty)) {
      widgets.add(Text(widget.message));
      for (int i = 0; i < widget.resultsPrevious.length; i++) {
        var result = widget.resultsPrevious[i];
        widgets.add(Text(result.key + ": " + result.value));
      }
    }

    if ((widget.extraFields != null) && (widget.extraFields.isNotEmpty)) {
      widgets.addAll(widget.extraFields);
    }

    if (widgets.length > 0) {
      return Column(children: widgets);
    } else {
      return Text(widget.message);
    }
  }
}

class YesNoDialogWithAssignmentResults extends StatelessWidget {
  final String title;
  final String message;
  final List<AssignmentResultModel> resultsPrevious;
  final Function yesFunction;
  final Function noFunction;
  final List<Widget> extraFields;

  const YesNoDialogWithAssignmentResults(
      {Key key,
      this.title,
      this.message,
      this.resultsPrevious,
      this.yesFunction,
      this.noFunction,
      this.extraFields})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogWithAssignmentResults(
      title: title,
      message: message,
      resultsPrevious: resultsPrevious,
      buttonLabels: ['Cancel', 'Continue'],
      functions: [noFunction, yesFunction],
      extraFields: extraFields,
    );
  }
}

class YesNoIgnoreDialogWithAssignmentResults extends StatelessWidget {
  final String title;
  final String message;
  final List<AssignmentResultModel> resultsPrevious;
  final Function yesFunction;
  final Function noFunction;
  final List<Widget> extraFields;

  const YesNoIgnoreDialogWithAssignmentResults(
      {Key key,
      this.title,
      this.message,
      this.resultsPrevious,
      this.yesFunction,
      this.noFunction,
      this.extraFields})
      : super(key: key);

  void pop(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return DialogWithAssignmentResults(
        title: title,
        message: message,
        resultsPrevious: resultsPrevious,
        buttonLabels: ['Later', 'Cancel', 'Continue'],
        functions: [
          () => Navigator.pop(context),
          noFunction,
          yesFunction,
        ],
        extraFields: extraFields);
  }
}

