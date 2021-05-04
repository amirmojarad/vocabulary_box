import 'package:flutter/material.dart';
import 'package:vocabulary_box/models/lesson.dart';
import 'package:vocabulary_box/ui/lesson/lesson_layout.dart';

class LessonUI extends StatefulWidget {
  Lesson lesson;

  LessonUI(this.lesson);

  @override
  _LessonUIState createState() => _LessonUIState();
}

class _LessonUIState extends State<LessonUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.lesson.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).buttonColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: LessonLayout(widget.lesson),
    );
  }
}
