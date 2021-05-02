import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocabulary_box/ui/lessons/lessons_ui.dart';
import 'package:vocabulary_box/ui/utils/colors.dart' as colors;
import 'package:vocabulary_box/ui/utils/fonts.dart' as fonts;

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
        accentColor: colors.accent,
        dividerColor: colors.divider,
        primaryIconTheme: IconThemeData(color: Color(0xff131313), size: 30),
        textTheme:
            TextTheme(subtitle1: fonts.subtitle1, bodyText1: fonts.bodyText1),
      ),
      home: LessonsUI(),
    );
  }
}
