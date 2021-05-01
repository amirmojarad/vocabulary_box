import 'package:flutter/material.dart';
import 'package:vocabulary_box/ui/lessons/lessons_ui.dart';
import 'package:vocabulary_box/ui/utils/colors.dart' as colors;

class VocabularyBox extends StatefulWidget {
  @override
  _VocabularyBoxState createState() => _VocabularyBoxState();
}

class _VocabularyBoxState extends State<VocabularyBox> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(),
      theme: ThemeData(
        backgroundColor: colors.background,
      ),
      home: LessonsUI(),
    );
  }
}
