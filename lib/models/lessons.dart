import 'package:vocabulary_box/models/lesson.dart';
import 'package:vocabulary_box/ui/utils/colors.dart';

class Lessons {
  List<Lesson> lessons;

  bool contains(String title) {
    for (var lesson in lessons) {
      if (lesson.title.startsWith(title)) {
        return true;
      }
    }
    return false;
  }

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
