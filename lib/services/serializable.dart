import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'json_provider.dart';

class Serializable {
  String _fileName;
  Directory _directory;
  String _fullPath;
  String _rawJson;
  File _file;

  Serializable(String fileName) {
    this._fileName = fileName;
  }

  _fetch() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      this._fullPath = join(directory.path, _fileName);
      _file = File(_fullPath);
      _rawJson = await _file.readAsString();
    } catch (e) {
      await save({"last_id": 0, "lessons": []});
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
