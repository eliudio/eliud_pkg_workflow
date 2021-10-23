import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';
import 'example_task_model_1.dart';

class ExampleTaskModel1EditorWidget extends StatefulWidget {
  static taskEditor (model) => ExampleTaskModel1EditorWidget(model: model,);

  final ExampleTaskModel1 model;

  const ExampleTaskModel1EditorWidget(
      {Key? key,
      required this.model})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExampleTaskModel1EditorWidgetState();
}

class _ExampleTaskModel1EditorWidgetState extends State<ExampleTaskModel1EditorWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
            getListTile(context,
                leading: Icon(Icons.description),
                title: dialogField(
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
