import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_retrofit/api/api_service.dart';
import 'package:flutter_retrofit/screen/home_screen.dart';
import 'package:flutter_retrofit/screen/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{

  SharedPreferences prefs = await SharedPreferences.getInstance();

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

extension OptionalInfixAddition<T extends num> on T? {
  T? operator + (T? other) {
    final shadow = this;
    if(shadow != null) {
      return shadow + (other ?? 0) as T;
    } else {
      return null;
    }
  }
}

class Counter extends StateNotifier<int?> {
  Counter(super.state);
  void increment() => state == null ? 1 : state + 1;
  int? get value => state;
}

void textIt() {
  const int? num1 = 1;
  const int num2 = 1;
  final result = num1 + num2;
}

final currentDate = Provider((ref) => DateTime.now());

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(currentDate);
    return Scaffold(
      appBar: AppBar(
        title: const Text("RiverPod"),
      ), body: Center(
      child: Text(date.toIso8601String(), style: Theme.of(context).textTheme.headline4),
    ),
    );
  }
}
