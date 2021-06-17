/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_task_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/has_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/tools/delete_snackbar.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/eliud.dart';

import 'package:eliud_pkg_workflow/model/workflow_task_list_event.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_list_state.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_list_bloc.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_model.dart';

import 'package:eliud_core/model/app_model.dart';


import 'workflow_task_form.dart';


typedef WorkflowTaskWidgetProvider(WorkflowTaskModel? value);

class WorkflowTaskListWidget extends StatefulWidget with HasFab {
  BackgroundModel? listBackground;
  WorkflowTaskWidgetProvider? widgetProvider;
  bool? readOnly;
  String? form;
  WorkflowTaskListWidgetState? state;
  bool? isEmbedded;

  WorkflowTaskListWidget({ Key? key, this.readOnly, this.form, this.widgetProvider, this.isEmbedded, this.listBackground }): super(key: key);

  @override
  WorkflowTaskListWidgetState createState() {
    state ??= WorkflowTaskListWidgetState();
    return state!;
  }

  @override
  Widget? fab(BuildContext context) {
    if ((readOnly != null) && readOnly!) return null;
    state ??= WorkflowTaskListWidgetState();
    var accessState = AccessBloc.getState(context);
    return state!.fab(context, accessState);
  }
}

class WorkflowTaskListWidgetState extends State<WorkflowTaskListWidget> {
  @override
  Widget? fab(BuildContext aContext, AccessState accessState) {
    if (accessState is AppLoaded) {
      return !accessState.memberIsOwner() 
        ? null
        : StyleRegistry.registry().styleWithContext(context).adminListStyle().floatingActionButton(context, 'PageFloatBtnTag', Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            pageRouteBuilder(accessState.app, page: BlocProvider.value(
                value: BlocProvider.of<WorkflowTaskListBloc>(context),
                child: WorkflowTaskForm(
                    value: null,
                    formAction: FormAction.AddAction)
            )),
          );
        },
      );
    } else {
      return Text('App not loaded');
    }
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    if (accessState is AppLoaded) {
      return BlocBuilder<WorkflowTaskListBloc, WorkflowTaskListState>(builder: (context, state) {
        if (state is WorkflowTaskListLoading) {
          return Center(
            child: DelayedCircularProgressIndicator(),
          );
        } else if (state is WorkflowTaskListLoaded) {
          final values = state.values;
          if ((widget.isEmbedded != null) && widget.isEmbedded!) {
            var children = <Widget>[];
            children.add(theList(context, values, accessState));
            children.add(
                StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(
                    context, label: 'Add',
                    onPressed: () {
                      Navigator.of(context).push(
                                pageRouteBuilder(accessState.app, page: BlocProvider.value(
                                    value: BlocProvider.of<WorkflowTaskListBloc>(context),
                                    child: WorkflowTaskForm(
                                        value: null,
                                        formAction: FormAction.AddAction)
                                )),
                              );
                    },
                  ));
            return ListView(
              padding: const EdgeInsets.all(8),
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: children
            );
          } else {
            return theList(context, values, accessState);
          }
        } else {
          return Center(
            child: DelayedCircularProgressIndicator(),
          );
        }
      });
    } else {
      return Text("App not loaded");
    } 
  }
  
  Widget theList(BuildContext context, values, AppLoaded accessState) {
    return Container(
      decoration: widget.listBackground == null ? StyleRegistry.registry().styleWithContext(context).adminListStyle().boxDecorator(context) : BoxDecorationHelper.boxDecoration(accessState, widget.listBackground),
      child: ListView.separated(
        separatorBuilder: (context, index) => StyleRegistry.registry().styleWithContext(context).adminListStyle().divider(context),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: values.length,
        itemBuilder: (context, index) {
          final value = values[index];
          
          if (widget.widgetProvider != null) return widget.widgetProvider!(value);

          return WorkflowTaskListItem(
            value: value,
            app: accessState.app,
            onDismissed: (direction) {
              BlocProvider.of<WorkflowTaskListBloc>(context)
                  .add(DeleteWorkflowTaskList(value: value));
              Scaffold.of(context).showSnackBar(DeleteSnackBar(
                message: "WorkflowTask " + value.documentID,
                onUndo: () => BlocProvider.of<WorkflowTaskListBloc>(context)
                    .add(AddWorkflowTaskList(value: value)),
              ));
            },
            onTap: () async {
                                   final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(accessState.app, page: BlocProvider.value(
                              value: BlocProvider.of<WorkflowTaskListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "WorkflowTask " + value.documentID,
                            onUndo: () => BlocProvider.of<WorkflowTaskListBloc>(context)
                                .add(AddWorkflowTaskList(value: value)),
                          ),
                        );
                      }

            },
          );
        }
      ));
  }
  
  
  Widget? getForm(value, action) {
    if (widget.form == null) {
      return WorkflowTaskForm(value: value, formAction: action);
    } else {
      return null;
    }
  }
  
  
}


class WorkflowTaskListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final AppModel app;
  final WorkflowTaskModel? value;

  WorkflowTaskListItem({
    Key? key,
    required this.onDismissed,
    required this.onTap,
    required this.value,
    required this.app,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__WorkflowTask_item_${value!.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Hero(
          tag: '${value!.documentID}__WorkflowTaskheroTag',
          child: Container(
            width: fullScreenWidth(context),
            child: Center(child: StyleRegistry.registry().styleWithContext(context).adminListStyle().listItem(context, value!.documentID!)),
          ),
        ),
        subtitle: (value!.documentID! != null) && (value!.documentID!.isNotEmpty)
            ? Center(child: StyleRegistry.registry().styleWithContext(context).adminListStyle().listItem(context, value!.documentID!))
            : null,
      ),
    );
  }
}

