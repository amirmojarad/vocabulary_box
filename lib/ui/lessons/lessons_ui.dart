import 'package:flutter/material.dart';
import 'package:vocabulary_box/ui/lessons/lessons_layout.dart';
import 'package:vocabulary_box/ui/lessons/widgets/app_bar.dart';
import 'package:vocabulary_box/ui/lessons/widgets/floating_button.dart';
import 'package:vocabulary_box/ui/utils/device.dart';

class LessonsUI extends StatefulWidget {
  @override
  _LessonsUIState createState() => _LessonsUIState();
}

class _LessonsUIState extends State<LessonsUI> {
  @override
  Widget build(BuildContext context) {
    device = Device(context);
    return Scaffold(
      floatingActionButton: buildFloatingButton(context, () {
        setState(() {});
      }),
      appBar: buildAppBar(context),
      body: LessonsLayout(),
    );
  }
}
