import 'package:flutter/material.dart';
import 'package:vocabulary_box/models/lesson.dart';
class LessonLayout extends StatefulWidget {
  Lesson lesson;

  LessonLayout(this.lesson);

  @override
  _LessonLayoutState createState() => _LessonLayoutState();
}

class _LessonLayoutState extends State<LessonLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Theme.of(context).backgroundColor,
    ));
  }
}
