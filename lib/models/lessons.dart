import 'package:vocabulary_box/models/lesson.dart';

class Lessons {
  List<Lesson> lessons;

  Lessons(List<dynamic> lessons) {
    this.lessons = [];
    lessons.forEach((element) {
      this.lessons.add(Lesson.fromJson(element));
    });
  }

  toJson() {
    var list = [];
    lessons.forEach((element) {
      list.add(element.toJson());
    });
    return list;
  }
}
