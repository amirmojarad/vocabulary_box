import 'dart:convert';
import 'dart:io';

import 'json_provider.dart';

class Serializable {
  String _jsonPath;
  String _rawJson;
  File _file;

  Serializable(String fileName) {
    this._jsonPath = "assets/$fileName.json";
    _file = File(_jsonPath);
  }

  _fetch() async {
    try {
      _rawJson = await _file.readAsString();
    } catch (e) {
      print("Couldn't read file");
    }
  }

  Future<JsonProvider> load() async {
    await _fetch();
    return JsonProvider.fromJson(await jsonDecode(_rawJson));
  }

  Future<void> save(Map<String, dynamic> json) async {
    await _file.writeAsString(jsonEncode(json));
  }
}
