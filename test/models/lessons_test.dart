import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:vocabulary_box/models/lesson.dart';
import 'package:vocabulary_box/models/lessons.dart';

void main() {
  Lessons lessons = Lessons([]);
  test('initial state', () {
    expect(lessons.lessons, []);
  });
  test('add lesson', () {
    Lesson lesson = Lesson.withAttributes('lesson1', 0, []);
    lessons.lessons.add(lesson);
    expect(lessons.lessons.length, 1);
  });
  test('test contains method', () {
    Lesson lesson = Lesson.withAttributes('lesson1', 0, []);
    lessons.lessons.add(lesson);
    expect(lessons.contains('lesson1'), true);
  });
}
