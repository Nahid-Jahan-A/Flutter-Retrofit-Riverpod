import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_retrofit/api/api_service.dart';
import 'package:flutter_retrofit/practice/practice_codes.dart';
import 'package:flutter_retrofit/routes/routes.dart';
import 'package:flutter_retrofit/providers/sharedPreferenceProvider.dart';
import 'package:flutter_retrofit/providers/token_provider.dart';
import 'package:flutter_retrofit/screen/home_screen.dart';
import 'package:flutter_retrofit/screen/login_screen.dart';
import 'package:flutter_retrofit/util/global_values.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:routemaster/routemaster.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_riverpod/shared_preferences_riverpod.dart';

void main() async {
  retrieveTokens();
  // prefs = await SharedPreferences.getInstance();
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessToken = ref.watch(accessTokenProvider);
    return MaterialApp.router(
      routeInformationParser: const RoutemasterParser(),
      routerDelegate: RoutemasterDelegate(
        routesBuilder: (context) => routes
      ),
      title: 'Flutter Retrofit Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}



