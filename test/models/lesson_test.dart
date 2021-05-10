import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:vocabulary_box/models/lesson.dart';

void main() {
  Lesson lesson = Lesson.withAttributes('lesson1', 0, []);

  test('with attributes', () {
    expect(lesson.words, []);
    expect(lesson.title, "lesson1");
    expect(lesson.id, 0);
  });
  test('toJson', () {
    expect(lesson.toJson(), {
      "title": 'lesson1',
      "id": 0,
      "words": [],
    });
  });
}
