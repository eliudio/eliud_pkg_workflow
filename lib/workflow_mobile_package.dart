import 'package:eliud_pkg_workflow/workflow_package.dart';
import 'model/abstract_repository_singleton.dart';
import 'model/component_registry.dart';
import 'model/repository_singleton.dart';

class WorkflowMobilePackage extends WorkflowPackage {
  @override
  void init() {
    AbstractRepositorySingleton.singleton = RepositorySingleton();
    super.init();
  }
}
