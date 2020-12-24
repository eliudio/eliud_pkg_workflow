import 'package:eliud_pkg_workflow/workflow_package.dart';

import 'model/abstract_repository_singleton.dart';
import 'model/js_repository_singleton.dart';

class WorkflowWebPackage extends WorkflowPackage {
  @override
  void init() {
    AbstractRepositorySingleton.singleton = JsRepositorySingleton();
    super.init();
  }
}
