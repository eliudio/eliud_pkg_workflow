import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core_helpers/firestore/firestore_tools.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_pkg_workflow_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow_model/model/assignment_model.dart';
import 'package:eliud_pkg_workflow_model/model/assignment_list_event.dart';
import 'package:eliud_pkg_workflow_model/model/assignment_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAssignmentListItem extends StatelessWidget {
  final AppModel app;
  final AssignmentModel value;

  MyAssignmentListItem({
    super.key,
    required this.app,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    var member = AccessBloc.member(context);
    var style = /*((value.read == null) || (value.read)) ? null : */
        TextStyle(fontWeight: FontWeight.bold);
    return Dismissible(
        key: Key('_Assignment_item_${value.documentID}'),
        onDismissed: (_) {
          BlocProvider.of<AssignmentListBloc>(context)
              .add(DeleteAssignmentList(value: value));
        },
        child: ListTile(
            onTap: () async {
              var valueWithRelations =
                  await assignmentRepository(appId: app.documentID)!
                      .get(value.documentID);
              value.task!.callExecute(
                  app, context, member?.documentID, valueWithRelations, false);
            },
            trailing: Text(formatFullPrecision(value.timestamp), style: style),
            title: Text(
              value.task!.description,
              style: style,
            )));
  }
}
