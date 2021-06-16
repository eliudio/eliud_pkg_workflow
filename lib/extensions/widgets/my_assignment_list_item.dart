import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/assignment_list_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_list_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../assignment_view_component.dart';

class MyAssignmentListItem extends StatelessWidget {
  final AssignmentModel value;

  MyAssignmentListItem({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    var style = /*((value.read == null) || (value.read)) ? null : */new TextStyle(fontWeight: FontWeight.bold);
    return Dismissible(
      key: Key('_Assignment_item_${value.documentID}'),
      onDismissed: (_) {
        BlocProvider.of<AssignmentListBloc>(context)
            .add(DeleteAssignmentList(value: value));
      },
      child: ListTile(
        onTap: () async {
          var valueWithRelations = await assignmentRepository(appId: app!.documentID)!.get(value.documentID);
          value.task!.callExecute(Registry.navigatorKey.currentContext, valueWithRelations, false);
        },
        trailing: Text(value.timestamp!, style: style),
        title: Text(value.task!.description == null ? "?" : value.task!.description!, style: style,))
      );
  }
}
