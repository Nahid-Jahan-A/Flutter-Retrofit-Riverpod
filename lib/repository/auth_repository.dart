import 'package:flutter_retrofit/models/api_response.dart';
import 'package:flutter_retrofit/models/auth.dart';

import '../api/api_service.dart';

class AuthRepository {
  final UtkorshoApiClient _utkorshoApiClient;

  AuthRepository(this._utkorshoApiClient);

  Future<ApiResponse<Auth>> getAuth(payload) async {
    return _utkorshoApiClient.login(payload);
  }
}
