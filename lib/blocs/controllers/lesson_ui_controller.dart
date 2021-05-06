import 'package:flutter/material.dart';
import 'package:vocabulary_box/blocs/lessons_bloc.dart';
import 'package:vocabulary_box/models/lesson.dart';
import 'package:vocabulary_box/models/word.dart';
import 'package:vocabulary_box/ui/utils/device.dart';

class LessonUIController {
  TextEditingController controller = TextEditingController();
  TextEditingController meaningsController = TextEditingController();
  FocusScopeNode wordNode, meaningNode;

  Map<String, List<Word>> alphabeticMap;

  next(BuildContext context) {
    FocusScope.of(context).requestFocus(meaningNode);
  }

  Future<void> save() async {
    await lessonBloc.save();
  }

  _generateAlphabetMap(Lesson lesson) {
    alphabeticMap = {
      "A": [],
      "B": [],
      "C": [],
      "D": [],
      "E": [],
      "F": [],
      "G": [],
      "H": [],
      "I": [],
      "J": [],
      "K": [],
      "L": [],
      "M": [],
      "N": [],
      "O": [],
      "P": [],
      "Q": [],
      "R": [],
      "S": [],
      "T": [],
      "U": [],
      "V": [],
      "W": [],
      "X": [],
      "Y": [],
      "Z": [],
    };
    lesson.words.forEach((element) {
      alphabeticMap.forEach((key, value) {
        if (element.word.startsWith(key.toLowerCase())) {
          value.add(element);
        }
      });
    });
    alphabeticMap.removeWhere((key, value) {
      if (value.isEmpty) return true;
      return false;
    });
  }

  List<Widget> makeWords(
      Lesson lesson, BuildContext context, Function setState) {
    List<Widget> result = [];
    _generateAlphabetMap(lesson);
    alphabeticMap.forEach((key, value) {
      result.add(Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 8),
        child: Text(key, style: Theme.of(context).textTheme.headline1),
      ));
      result.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 32),
        child: SizedBox(child: Divider(), width: device.width),
      ));
      value.forEach((element) {
        result.add(buildWordRow(element, context, setState, lesson));
      });
    });
    return result;
  }

  Widget buildWordRow(
      Word word, BuildContext context, Function setState, Lesson lesson) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          lesson.words.remove(word);
          setState();
        },
        child: Column(
          children: [
            Container(
              width: device.width,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Theme.of(context).dividerColor, width: 0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(word.word,
                        style: Theme.of(context).textTheme.bodyText1),
                    Text(word.meaningsToString(),
                        style: Theme.of(context).textTheme.subtitle1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addNewWord(BuildContext context, Lesson lesson, Function function) {
    if (controller.text.isEmpty || controller.text.isEmpty) {
      meaningsController.clear();
      controller.clear();
      return;
    }
    var newWord = Word.withAttributes(
        word: controller.text, meanings: [meaningsController.text]);
    if (lesson.words.contains(newWord)) {
      if (!lesson.words
          .elementAt(lesson.words.indexOf(newWord))
          .meanings
          .contains(meaningsController.text))
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