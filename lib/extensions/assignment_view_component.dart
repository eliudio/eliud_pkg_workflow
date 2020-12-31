import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/assignment_list.dart';
import 'package:eliud_pkg_workflow/model/assignment_list_bloc.dart';
import 'package:eliud_pkg_workflow/model/assignment_list_event.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_component.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../workflow_package.dart';

class AssignmentViewComponentConstructorDefault
    implements ComponentConstructor {
  Widget createNew({String id, Map<String, Object> parameters}) {
    return AssignmentViewComponentImpl(id: id);
  }
}

class AssignmentViewComponentImpl extends AbstractAssignmentViewComponent {
  AssignmentViewComponentImpl({String id}) : super(assignmentViewID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

//  static BuildContext theInstance;

  @override
  Widget yourWidget(BuildContext context, AssignmentViewModel view) {
    //theInstance = context;
    var state = AccessBloc.getState(context);
    if (state is AppLoaded) {
      return BlocProvider<AssignmentListBloc>(
        create: (context) => AssignmentListBloc(
          AccessBloc.getBloc(context),
          eliudQuery: WorkflowPackage.getOpenAssignmentsQuery(
              state.app.documentID, state.getMember().documentID),
          assignmentRepository:
              assignmentRepository(appId: AccessBloc.appId(context)),
        )..add(LoadAssignmentList()),
        child: AssignmentListWidget(
            readOnly: true,
            listItemWidget: "MyAssignmentListItem",
            listBackground: BackgroundModel(documentID: "`transparent")),
      );
    } else {
      return DelayedCircularProgressIndicator();
    }
  }

  @override
  AssignmentViewRepository getAssignmentViewRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton
        .assignmentViewRepository(AccessBloc.appId(context));
  }
}