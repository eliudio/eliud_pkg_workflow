import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/random.dart';

import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';

import '../../model/assignment_view_entity.dart';

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
