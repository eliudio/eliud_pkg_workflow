import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_component.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_repository.dart';
import 'package:flutter/material.dart';

class AssignmentViewComponentConstructorDefault implements ComponentConstructor {
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

  @override
  Widget yourWidget(BuildContext context, AssignmentViewModel view) {
    return Text("Your assignments");
  }

  @override
  AssignmentViewRepository getAssignmentViewRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.assignmentViewRepository(AccessBloc.appId(context));
  }
}

