import 'package:flutter/material.dart';
import 'package:vocabulary_box/ui/lessons/lessons_layout.dart';

class LessonsUI extends StatefulWidget {
  @override
  _LessonsUIState createState() => _LessonsUIState();
}

class _LessonsUIState extends State<LessonsUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).backgroundColor),
      body: LessonsLayout(),
    );
  }
}
