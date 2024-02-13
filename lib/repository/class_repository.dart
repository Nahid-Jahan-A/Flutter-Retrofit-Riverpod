import 'package:flutter_retrofit/api/api_service.dart';
import 'package:flutter_retrofit/models/class.dart';

class ClassRepository {
  final UtkorshoApiClientForClass _utkorshoApiClientForClass;

  ClassRepository(this._utkorshoApiClientForClass);

  Future<ClassData> getClasses() async {
    return _utkorshoApiClientForClass.getClassData();
  }
}
