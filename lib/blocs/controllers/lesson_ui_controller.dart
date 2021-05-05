import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocabulary_box/models/lesson.dart';
import 'package:vocabulary_box/models/word.dart';

import '../lessons_bloc.dart';

class LessonUIController {
  TextEditingController controller = TextEditingController();
  TextEditingController meaningsController = TextEditingController();
  FocusScopeNode node;

  void next(BuildContext context) {
    FocusScope.of(context).requestFocus(node);
  }

  Future<void> save() async {
    lessonBloc.save();
  }

  void addNewWord(BuildContext context, Lesson lesson, Function function) {
    var newWord = Word.withAttributes(
        word: controller.text, meanings: [meaningsController.text]);
    if (lesson.words.contains(newWord)) {
      lesson.words
          .elementAt(lesson.words.indexOf(newWord))
          .meanings
          .add(meaningsController.text);
    } else {
      lesson.words.add(newWord);
    }
    lessonBloc.jsonProvider.addLesson(lesson);
    meaningsController.clear();
    function();
  }

  void addMeanings(BuildContext context, Lesson lesson, Function function) {
    addNewWord(context, lesson, function);
    FocusScope.of(context).nextFocus();
  }
}
