import 'package:flutter/material.dart';
import 'package:vocabulary_box/blocs/lessons_bloc.dart';
import 'package:vocabulary_box/models/lesson.dart';

class BottomSheetController {
  TextEditingController controller = TextEditingController();

  Future<void> addNewLesson(BuildContext context) async {
    var newLesson = Lesson.withAttributes(controller.text, 0, []);
    lessonBloc.jsonProvider.addLesson(newLesson);
    await lessonBloc.save();
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }
}
