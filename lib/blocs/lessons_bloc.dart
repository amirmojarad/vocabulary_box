import 'package:vocabulary_box/models/lessons.dart';
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
    try{
      jsonProvider = await _serializable.load();
    }catch(_){
      jsonProvider = JsonProvider(Lessons([]), false, 0);
    }
    return jsonProvider;
  }

  Future<bool> save() async {
    await this._serializable.save(jsonProvider.toJson());
    return true;
  }
}

LessonBloc lessonBloc = LessonBloc();
