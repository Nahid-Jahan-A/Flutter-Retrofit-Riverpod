import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_riverpod/shared_preferences_riverpod.dart';

final sharedPrefsProvider = FutureProvider<SharedPreferences>(
    (_) async => await SharedPreferences.getInstance());

// late SharedPreferences prefs;
// final accessTokenPrefProvider = createPrefProvider<String?>(
//   prefs: (_) => prefs,
//   prefKey: "accessToken",
//   defaultValue: 'acc tkn',
// );


class TokenProvider {
  TokenProvider({
    required this.prefs
});

  final SharedPreferences prefs;

  void getAccessToken() {
    final accessTokenPrefProvider = createPrefProvider<String?>(
      prefs: (_) => prefs,
      prefKey: "accessToken",
      defaultValue: 'acc tkn',
    );
  }

  void getRefreshToken() {
    final refreshTokenPrefProvider = createPrefProvider<String?>(
      prefs: (_) => prefs,
      prefKey: 'refreshToken',
      defaultValue: 'ref tkn',
    );
  }
}

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) {
  return SharedPreferences.getInstance();
});

class SharedPreferencesProvider {
  final SharedPreferences sharedPreferences;

  SharedPreferencesProvider(this.sharedPreferences);

  String? getToken() {
    return sharedPreferences.getString('token');
  }

  void setToken(String token) {
    sharedPreferences.setString('token', token);
  }
}

