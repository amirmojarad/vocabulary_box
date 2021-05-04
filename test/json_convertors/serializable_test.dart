import 'package:flutter_test/flutter_test.dart';
import 'package:vocabulary_box/models/lesson.dart';
import 'package:vocabulary_box/models/word.dart';
import 'package:vocabulary_box/services/serializable.dart';

void main() {
  Serializable serializable = Serializable('lessons');

  test('load test', () async {
    var jsonProvider = await serializable.load();
  });
  test('save test : only write', () async {
    var jsonProvider = await serializable.load();
    serializable.save(jsonProvider.toJson());
  });
  test('save test: add one lesson', () async {
    var jsonProvider = await serializable.load();
    jsonProvider.addLesson(Lesson.withAttributes("lesson 01", 0, [
      Word.withAttributes(word: "apple", meanings: ["sib"])
    ]));
    serializable.save(jsonProvider.toJson());
  });
}
