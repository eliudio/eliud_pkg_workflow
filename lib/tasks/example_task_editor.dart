import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/style/frontend/has_dialog_field.dart';
import 'package:eliud_core_model/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';
import 'example_task_model_1.dart';

class ExampleTaskModel1EditorWidget extends StatefulWidget {
  final AppModel app;
  static taskEditor(AppModel app, model) => ExampleTaskModel1EditorWidget(
        model: model,
        app: app,
      );

  final ExampleTaskModel1 model;

  const ExampleTaskModel1EditorWidget(
      {super.key, required this.model, required this.app});

  @override
  State<StatefulWidget> createState() => _ExampleTaskModel1EditorWidgetState();
}

class _ExampleTaskModel1EditorWidgetState
    extends State<ExampleTaskModel1EditorWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      getListTile(context, widget.app,
          leading: Icon(Icons.description),
          title: dialogField(
            widget.app,
            context,
            initialValue: widget.model.extraParameter,
            valueChanged: (value) {
              widget.model.extraParameter = value;
            },
            decoration: const InputDecoration(
              hintText: 'Extra parameters',
              labelText: 'Extra parameters',
            ),
          )),
    ]);
  }
}
