import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/background_model.dart';
import 'package:eliud_core_model/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_pkg_workflow/extensions/widgets/my_assignment_list_item.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/assignment_list.dart';
import 'package:eliud_pkg_workflow/model/assignment_list_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_list_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_component.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../workflow_package.dart';

class AssignmentViewComponentConstructorDefault
    implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return AssignmentViewComponentImpl(key: key, app: app, id: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await assignmentViewRepository(appId: app.documentID)!.get(id);
}

class AssignmentViewComponentImpl extends AbstractAssignmentViewComponent {
  AssignmentViewComponentImpl(
      {super.key, required super.app, required String id})
      : super(assignmentViewId: id);

  @override
  Widget yourWidget(BuildContext context, AssignmentViewModel? value) {
    //theInstance = context;
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      if (accessState is AccessDetermined) {
        return BlocProvider<AssignmentListBloc>(
          create: (context) => AssignmentListBloc(
            eliudQuery: WorkflowPackage.getOpenAssignmentsQuery(
                app.documentID, accessState.getMember()!.documentID),
            assignmentRepository: assignmentRepository(appId: app.documentID)!,
          )..add(LoadAssignmentList()),
          child: AssignmentListWidget(
              app: app,
              readOnly: true,
              widgetProvider: widgetProvider,
              listBackground: BackgroundModel()),
        );
      } else {
        return progressIndicator(app, context);
      }
    });
  }

  Widget widgetProvider(AssignmentModel? value) {
    if (value == null) {
      return Text("Assignment not available");
    } else {
      return MyAssignmentListItem(app: app, value: value);
    }
  }
}
