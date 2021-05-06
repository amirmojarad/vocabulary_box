import 'package:vocabulary_box/services/json_provider.dart';
import 'package:vocabulary_box/services/serializable.dart';

class LessonBloc {
  Serializable _serializable;
  JsonProvider jsonProvider;
  final String _fileName = "lessons";

  LessonBloc() {
    this._serializable = Serializable(_fileName);
  }

  Future<JsonProvider> fetch() async {
    jsonProvider = await _serializable.load();
    return jsonProvider;
  }

  Future<bool> save() async {
    await this._serializable.save(jsonProvider.toJson());
    return true;
  }
}

LessonBloc lessonBloc = LessonBloc();
