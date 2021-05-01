import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:vocabulary_box/business_logic/models/word.dart';

void main() {
  test('word class test', () {
    Map<String, dynamic> json = {
      "word": "Apple",
      "meanings": ["first", "second", "third"]
    };
    Word word = Word.fromJson(json);
    expect(word.word, "Apple");
    expect(word.meanings.length, 3);
  });
}
