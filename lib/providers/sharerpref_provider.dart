import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_riverpod/shared_preferences_riverpod.dart';

final sharedPrefs = FutureProvider<SharedPreferences>(
    (_) async => await SharedPreferences.getInstance());


class TokenProvider {
  TokenProvider({
    required this.prefs
});

  final SharedPreferences prefs;

final refreshTokenPrefProvider = createPrefProvider<String?>(
  prefs: (_) => prefs,
  prefKey: 'refreshToken',
  defaultValue: 'ref tkn',
);
final accessTokenPrefProvider = createPrefProvider<String?>(
  prefs: (_) => prefs,
  prefKey: "accessToken",
  defaultValue: 'acc tkn',
);
}

