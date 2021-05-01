class Word {
  String word;
  List<String> meanings;

  Word.withAttributes({this.meanings, this.word});

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Word() {
    this.meanings = [];
  }
}

Word _$WordFromJson(Map<String, dynamic> json) {
  return Word.withAttributes(word: json['word'], meanings: json['meanings']);
}
