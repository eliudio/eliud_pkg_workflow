import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogWithAssignmentResults extends StatefulWidget {
  final String title;
  final String message;
  final List<AssignmentResultModel>? resultsPrevious;
  final List<String> buttonLabels;
  final List<VoidCallback> functions;
  final List<Widget>? extraFields;

  DialogWithAssignmentResults(
      {Key? key,
      required this.title,
      required this.message,
      required this.buttonLabels,
      required this.functions,
      this.resultsPrevious,
      this.extraFields})
      : super(key: key);

  @override
  _DialogWithAssignmentResultsState createState() =>
      _DialogWithAssignmentResultsState();
}

class _DialogWithAssignmentResultsState
    extends State<DialogWithAssignmentResults> {
  @override
  Widget build(BuildContext context) {
    return StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .flexibleDialog(context,
            title: widget.title,
            child: contents(context),
            buttons: StyleRegistry.registry()
                .styleWithContext(context)
                .frontEndStyle()
                .dialogButtons(context,
                    labels: widget.buttonLabels, functions: widget.functions));
  }

  Widget contents(BuildContext context) {
    List<Widget> widgets = [];
    if ((widget.resultsPrevious != null) &&
        (widget.resultsPrevious!.isNotEmpty)) {
      widgets.add(Text(widget.message));
      for (int i = 0; i < widget.resultsPrevious!.length; i++) {
        var result = widget.resultsPrevious![i];
        widgets.add(Text(result.key! + ": " + result.value!));
      }
    }

    if ((widget.extraFields != null) && (widget.extraFields!.isNotEmpty)) {
      widgets.addAll(widget.extraFields!);
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
  final List<AssignmentResultModel>? resultsPrevious;
  final VoidCallback yesFunction;
  final VoidCallback noFunction;
  final List<Widget>? extraFields;

  const YesNoDialogWithAssignmentResults(
      {Key? key,
      required this.title,
      required this.message,
      this.resultsPrevious,
      required this.yesFunction,
      required this.noFunction,
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
  final List<AssignmentResultModel>? resultsPrevious;
  final VoidCallback yesFunction;
  final VoidCallback noFunction;
  final List<Widget>? extraFields;
  final String? yesLabel;
  final String? noLabel;

  const YesNoIgnoreDialogWithAssignmentResults(
      {Key? key,
      required this.title,
      required this.message,
      this.resultsPrevious,
      required this.yesFunction,
      required this.noFunction,
      this.extraFields,
      this.yesLabel,
      this.noLabel})
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
        buttonLabels: [
          'Later',
          noLabel != null ? noLabel! : 'Cancel',
          yesLabel != null ? yesLabel! : 'Continue'
        ],
        functions: [
          () => Navigator.pop(context),
          noFunction,
          yesFunction,
        ],
        extraFields: extraFields);
  }
}
