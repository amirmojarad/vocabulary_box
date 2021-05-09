class Word {
  String word;
  List<String> meanings;

  Word.withAttributes({this.meanings, this.word});

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  String meaningsToString() {
    String result = "";
    meanings.forEach((element) {
      result += element + ", ";
    });
    result = result.substring(0, result.length - 2);
    return result;
  }

  Map<String, dynamic> toJson() {
    return {
      "word": this.word,
      "meanings": this.meanings,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Word && runtimeType == other.runtimeType && word == other.word;

  @override
  int get hashCode => word.hashCode;

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
