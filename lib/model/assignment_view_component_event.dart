/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow/model/assignment_view_model.dart';

abstract class AssignmentViewComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAssignmentViewComponent extends AssignmentViewComponentEvent {
  final String? id;

  FetchAssignmentViewComponent({this.id});
}

class AssignmentViewComponentUpdated extends AssignmentViewComponentEvent {
  final AssignmentViewModel value;

  AssignmentViewComponentUpdated({required this.value});
}
