import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_retrofit/api/api_service.dart';
import 'package:flutter_retrofit/screen/home_screen.dart';
import 'package:flutter_retrofit/screen/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

void main() {
  final logger = Logger();
  final dio = Dio();
  Map<String, dynamic> payload = {
    "loginId" : "admin@gmail.com",
    "password" : "Adm!n@123"
  };
  // dio.options.headers["demo_header"] = "Demo header";
  final client = UtkorshoApiClient(dio);

  client.login(payload).then((value) => logger.i(value));

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Retrofit Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
