import 'package:eliud_core/core/wizards/tools/documentIdentifier.dart';
import 'package:eliud_core/core/wizards/builders/dialog_builder.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart'
    as corerepo;
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_component.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';

class AssignmentDialogBuilder extends DialogBuilder {
  AssignmentDialogBuilder(
      String uniqueId, AppModel app, String dialogDocumentId)
      : super(uniqueId, app, dialogDocumentId);

  Future<DialogModel> _setupDialog() async {
    return await corerepo.AbstractRepositorySingleton.singleton
        .dialogRepository(app.documentID!)!
        .add(_dialog());
  }

  DialogModel _dialog() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "1",
        componentName: AbstractAssignmentViewComponent.componentName,
        componentId: constructDocumentId(uniqueId: uniqueId, documentId: dialogDocumentId)));

    return DialogModel(
        documentID: constructDocumentId(uniqueId: uniqueId, documentId: dialogDocumentId),
        appId: app.documentID!,
        title: "Assignments",
        layout: DialogLayout.ListView,
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple,
        ),
        bodyComponents: components);
  }

  AssignmentViewModel _assignmentViewModel() {
    return AssignmentViewModel(
      documentID: constructDocumentId(uniqueId: uniqueId, documentId: dialogDocumentId),
      appId: app.documentID!,
      description: "My Assignments",
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
  }

  Future<AssignmentViewModel> _setupAssignmentView() async {
    return await AbstractRepositorySingleton.singleton
        .assignmentViewRepository(app.documentID!)!
        .add(_assignmentViewModel());
  }

  Future<DialogModel> create() async {
    await _setupAssignmentView();
    return await _setupDialog();
  }
}
