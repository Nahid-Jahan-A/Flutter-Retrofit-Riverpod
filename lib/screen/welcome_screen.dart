import 'package:flutter/material.dart';
import 'package:flutter_retrofit/providers/token_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedPreferencesAsyncValue = ref.watch(sharedPreferencesProvider);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome "),
      ),
      body: Center(
        child: sharedPreferencesAsyncValue.when(
            data: (sharedPreference) {
              final accessToken = sharedPreference.get("accessToken");
              final refreshToken = sharedPreference.get("refreshToken");
              return ElevatedButton(onPressed: (){
                Logger logger = Logger();
                logger.i(accessToken);
                logger.i(refreshToken);
              },
                  child: Text("Get Token"),
              );
            },
            error: (error, stackTrace) => Text("Error $error"),
            loading: () => CircularProgressIndicator()),
      ),
    );
  }
}
