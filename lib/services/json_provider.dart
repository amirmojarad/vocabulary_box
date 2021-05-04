import 'package:vocabulary_box/models/lesson.dart';
import 'package:vocabulary_box/models/lessons.dart';

jsonProviderFromJson(Map<String, dynamic> json) {
  return JsonProvider(
    Lessons(json["lessons"]),
    json["first_opening"],
    json["last_id"],
  );
}

class JsonProvider {
  Lessons _lessons;
  bool _firstOpening;
  int _lastID;

  void addLesson(Lesson lesson) {
    lesson.id = ++_lastID;
    this._lessons.lessons.add(lesson);
  }

  Map<String, dynamic> toJson() => {
        "lessons": _lessons.toJson(),
        "first_opening": _firstOpening,
        "last_id": _lastID
      };

  factory JsonProvider.fromJson(Map<String, dynamic> json) =>
      jsonProviderFromJson(json);

  void remove(Lesson lesson) {
    this.lessons.lessons.remove(lesson);
  }

  Lessons get lessons => _lessons;

  JsonProvider(this._lessons, this._firstOpening, this._lastID) {
    this._firstOpening = false;
  }
}
