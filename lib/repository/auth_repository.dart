import 'package:flutter_retrofit/models/auth_data.dart';

import '../api/api_service.dart';

class AuthRepository {
  final UtkorshoApiClient _utkorshoApiClient;

  AuthRepository(this._utkorshoApiClient);

  Future<AuthData> getAuth(payload) async {
    return _utkorshoApiClient.login(payload);
  }
}
