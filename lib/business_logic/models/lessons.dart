class Lessons {
  String words;
  List<String> meanings;

  Lessons.fromJson(Map<String, dynamic> json) {
    this.words = json['words'];
    this.meanings = json['meanings'] as List<String>;
  }

  Lessons() {
    this.meanings = [];
  }



}
