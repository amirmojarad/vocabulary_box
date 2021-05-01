import 'package:vocabulary_box/business_logic/models/word.dart';

class Lesson {
  String title;
  int id;
  List<Word> words;

  Lesson.withAttributes(this.title, this.id, this.words);

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return Lesson.withAttributes(json['title'], json['id'], json['words']);
}
