import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocabulary_box/business_logic/models/lesson.dart';
import 'package:vocabulary_box/business_logic/view_models/lesson_provider.dart';

class LessonLayout extends StatefulWidget {
  Lesson lesson;

  LessonLayout(this.lesson);

  @override
  _LessonLayoutState createState() => _LessonLayoutState();
}

class _LessonLayoutState extends State<LessonLayout> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LessonProvider(),
      child: SafeArea(
          child: Container(
        color: Theme.of(context).backgroundColor,
      )),
    );
  }
}
