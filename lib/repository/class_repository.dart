import '../api/api_service.dart';
import '../models/class.dart';

class ClassRepository {
  final UtkorshoApiClientForCS _utkorshoApiClientForCS;

  ClassRepository(this._utkorshoApiClientForCS);

  Future<ClassData> getClasses() async {
    return _utkorshoApiClientForCS.getClassData();
  }

}