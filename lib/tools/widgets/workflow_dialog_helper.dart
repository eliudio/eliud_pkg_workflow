import 'package:eliud_core/tools/widgets/dialog_helper.dart';
import 'package:eliud_pkg_workflow/model/assignment_result_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YesNoDialogWithAssignmentResults extends StatefulWidget {
  final String title;
  final String message;
  final List<AssignmentResultModel> resultsPrevious;
  final Function yesFunction;
  final Function noFunction;

  YesNoDialogWithAssignmentResults({
    Key key,
    this.title,
    this.message, this.yesFunction, this.noFunction, this.resultsPrevious,
  }) : super(key: key);

  @override
  _YesNoDialogWithAssignmentResultsState createState() => _YesNoDialogWithAssignmentResultsState();
}

class _YesNoDialogWithAssignmentResultsState extends State<YesNoDialogWithAssignmentResults> {
  final DialogStateHelper dialogHelper = DialogStateHelper();

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        title: widget.title,
        contents: contents(context),
        buttons: dialogHelper.getYesNoButtons(context, widget.yesFunction, widget.noFunction));
  }

  Widget contents(BuildContext context) {
    List<Widget> widgets = [];
    if ((widget.resultsPrevious != null) && (widget.resultsPrevious.isNotEmpty)) {
      widgets.add(Text(widget.message));
      for (int i = 0; i < widget.resultsPrevious.length; i++) {
        var result = widget.resultsPrevious[i];
        widgets.add(Text(result.key + ": " + result.value));
      }
      return Column(children: widgets);
    } else {
      return Text(widget.message);
    }
  }
}