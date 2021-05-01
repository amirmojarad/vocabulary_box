import 'package:flutter/material.dart';
import 'package:vocabulary_box/ui/lessons/lessons_ui.dart';

class VocabularyBox extends StatefulWidget {
  @override
  _VocabularyBoxState createState() => _VocabularyBoxState();
}

class _VocabularyBoxState extends State<VocabularyBox> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(),
      theme: ThemeData(),
      home: LessonsUI(),
    );
  }
}
