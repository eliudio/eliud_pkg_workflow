import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_pkg_workflow/extensions/widgets/my_assignment_list_item.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/assignment_list.dart';
import 'package:eliud_pkg_workflow/model/assignment_list_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_list_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_component.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../workflow_package.dart';

class AssignmentViewComponentConstructorDefault
    implements ComponentConstructor {
  Widget createNew(
      {Key? key,
      required String appId,
      required String id,
      Map<String, dynamic>? parameters}) {
    return AssignmentViewComponentImpl(key: key, appId: appId, id: id);
  }

  @override
  Future<dynamic> getModel({required String appId, required String id}) async =>
      await assignmentViewRepository(appId: appId)!.get(id);
}

class AssignmentViewComponentImpl extends AbstractAssignmentViewComponent {
  AssignmentViewComponentImpl(
      {Key? key, required String appId, required String id})
      : super(key: key, theAppId: appId, assignmentViewId: id);

  @override
  Widget yourWidget(BuildContext context, AssignmentViewModel? view) {
    //theInstance = context;
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      if (accessState is AccessDetermined) {
        var currentAppId = accessState.currentAppId(context);
        return BlocProvider<AssignmentListBloc>(
          create: (context) => AssignmentListBloc(
            eliudQuery: WorkflowPackage.getOpenAssignmentsQuery(
                currentAppId,
                accessState.getMember()!.documentID!),
            assignmentRepository:
                assignmentRepository(appId: currentAppId)!,
          )..add(LoadAssignmentList()),
          child: AssignmentListWidget(
              readOnly: true,
              widgetProvider: widgetProvider,
              listBackground: BackgroundModel(documentID: "`transparent")),
        );
      } else {
        return progressIndicator(context);
      }
    });
  }

  Widget widgetProvider(AssignmentModel? value) {
    if (value == null) {
      return Text("Assignment not available");
    } else {
      return MyAssignmentListItem(value: value);
    }
  }
}
