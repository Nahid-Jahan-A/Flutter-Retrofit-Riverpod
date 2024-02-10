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

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) {
  return SharedPreferences.getInstance();
});

class AccessTokenProvider {
  final SharedPreferences sharedPreferences;

  AccessTokenProvider(this.sharedPreferences);

  String? get() {
    final accessTokenPrefProvider = createPrefProvider<String?>(
      prefs: (_) => sharedPreferences,
      prefKey: "accessToken",
      defaultValue: 'acc tkn',
    );
    return accessTokenPrefProvider.notifier.toString();
  }

  getRefreshToken() {
    final refreshTokenPrefProvider = createPrefProvider<String?>(
      prefs: (_) => sharedPreferences,
      prefKey: 'refreshToken',
      defaultValue: 'ref tkn',
    );
  }
}

class RefreshTokenProvider {
  final SharedPreferences sharedPreferences;

  RefreshTokenProvider(this.sharedPreferences);

  String? get() {
    final refreshTokenPrefProvider = createPrefProvider<String?>(
      prefs: (_) => sharedPreferences,
      prefKey: 'refreshToken',
      defaultValue: 'ref tkn',
    );
    return refreshTokenPrefProvider.notifier.toString();
  }
}

