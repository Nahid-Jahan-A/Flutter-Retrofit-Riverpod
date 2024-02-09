import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_retrofit/api/api_service.dart';
import 'package:flutter_retrofit/providers/sharerpref_provider.dart';
import 'package:flutter_retrofit/screen/home_screen.dart';
import 'package:flutter_retrofit/screen/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_riverpod/shared_preferences_riverpod.dart';

void main() async {
  // prefs = await SharedPreferences.getInstance();
  // WidgetsFlutterBinding.ensureInitialized();
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
      home: const HomePage(),
    );
  }
}


//Practice Code
extension OptionalInfixAddition<T extends num> on T? {
  T? operator +(T? other) {
    final shadow = this;
    if (shadow != null) {
      return shadow + (other ?? 0) as T;
    } else {
      return null;
    }
  }
}


//Practice class
class Counter extends StateNotifier<int?> {
  Counter() : super(null);

  var count = 0;

  void increment() => count = count + 1;
  int? get value => count;
}

//Practice code
final counterProvider =
StateProvider((ref) => 0);

final currentDate = Provider((ref) => DateTime.now());

//Practice class widget
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RiverPod"),
      ),
      body: Center(
          child: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final count = ref.watch(counterProvider);
              final text = count.toString();
              return Text(text);
            },
          ),
          TextButton(
            onPressed: ()  {
              ref.read(counterProvider.notifier).state++;
              print("Printing count from provider --> ${ref.watch(counterProvider)}");
            },
            child: const Text('Increment Counter'),
          ),
        ],
      )),
    );
  }
}
