import 'package:shared_preferences/shared_preferences.dart';

import '../providers/sharedPreferenceProvider.dart';

 SharedPreferences? sharedPreferences;

String? accessToken;
String? refreshToken;

Future<void> retrieveTokens() async {
  // Load SharedPreferences instance
  await sharedPreferencesProvider.future;

  // Now you can access the SharedPreferences instance stored in sharedPreferences
  String? accessToken = sharedPreferences?.getString('accessToken');
  String? refreshToken = sharedPreferences?.getString('refreshToken');
}
