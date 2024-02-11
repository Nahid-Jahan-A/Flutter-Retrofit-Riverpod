import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/global_values.dart';

final sharedPreferencesProvider = FutureProvider<SharedPreferences?>((ref) async {
  sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences;
});

final accessTokenProvider = Provider<String?>((ref) {
  // Access the SharedPreferences instance
  final sharedPreferences = ref.watch(sharedPreferencesProvider).value;
  // Retrieve the access token
  return sharedPreferences?.getString('accessToken');
});