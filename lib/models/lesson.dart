import 'package:vocabulary_box/models/word.dart';

class Lesson {
  String title;
  int id;
  List<Word> words;

  Lesson.withAttributes(this.title, this.id, this.words);

  Map<String, dynamic> toJson() {
    var list = [];
    words.forEach((element) {
      list.add(element.toJson());
    });
    return {
      "title": this.title,
      "id": this.id,
      "words": list,
    };
  }

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  List<Word> wordList = [];
  var words = json["words"] as List;
  words.forEach((element) {
    wordList.add(Word.fromJson(element));
  });
  return Lesson.withAttributes(json['title'], json['id'], wordList);
}
