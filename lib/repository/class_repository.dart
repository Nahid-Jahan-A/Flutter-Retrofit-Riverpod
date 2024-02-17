import 'package:flutter_retrofit/models/api_response.dart';

import '../api/api_service.dart';
import '../models/class_data.dart';

class ClassRepository {
  final UtkorshoApiClientForCS _utkorshoApiClientForCS;

  ClassRepository(this._utkorshoApiClientForCS);

  Future<ApiResponse<List<ClassData>>> getClasses() async {
    return _utkorshoApiClientForCS.getClassData();
  }

}