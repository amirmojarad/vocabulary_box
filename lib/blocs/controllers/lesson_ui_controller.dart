import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocabulary_box/blocs/lessons_bloc.dart';
import 'package:vocabulary_box/models/lesson.dart';
import 'package:vocabulary_box/models/word.dart';

class LessonUIController {
  TextEditingController controller = TextEditingController();
  TextEditingController meaningsController = TextEditingController();
  FocusScopeNode node;

  void next(BuildContext context) {
    FocusScope.of(context).requestFocus(node);
  }

  void addNewWord(BuildContext context, Lesson lesson) {
    if (!lesson.words.contains(controller.text)) {
      lesson.words.add(Word.withAttributes(
          meanings: [meaningsController.text], word: controller.text));
    } else {
      lesson.words.forEach(
        (element) {
          if (element.word == controller.text) {
            element.meanings.add(meaningsController.text);
          }
        },
      );
    }
  }

  void addMeanings(BuildContext context) {}
}
