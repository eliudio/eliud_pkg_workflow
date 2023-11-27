import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_pkg_workflow_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow_model/model/assignment_view_entity.dart';
import 'package:eliud_pkg_workflow_model/model/assignment_view_model.dart';
import 'package:eliud_core_helpers/etc/random.dart';

import 'package:eliud_core_main/editor/editor_base_bloc/editor_base_bloc.dart';

class AssignmentViewBloc
    extends EditorBaseBloc<AssignmentViewModel, AssignmentViewEntity> {
  AssignmentViewBloc(String appId, EditorFeedback feedback)
      : super(appId, assignmentViewRepository(appId: appId)!, feedback);

  @override
  AssignmentViewModel newInstance(StorageConditionsModel conditions) {
    return AssignmentViewModel(
        appId: appId,
        documentID: newRandomKey(),
        description: 'Assignment View',
        conditions: conditions);
  }

  @override
  AssignmentViewModel setDefaultValues(
      AssignmentViewModel t, StorageConditionsModel conditions) {
    return t.copyWith(conditions: t.conditions ?? conditions);
  }
}
