class Word {
  String word;
  List<String> meanings;

  Word.withAttributes({this.meanings, this.word});

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() {
    return {
      "word": this.word,
      "meanings": this.meanings,
    };
  }

  Word() {
    this.meanings = [];
  }
}

Word _$WordFromJson(Map<String, dynamic> json) {
  List<String> strings = [];
  var meanings = json["meanings"] as List;
  meanings.forEach((element) {
    strings.add(element as String);
  });
  return Word.withAttributes(word: json['word'], meanings: strings);
}
