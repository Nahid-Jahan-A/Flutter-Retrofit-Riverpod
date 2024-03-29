import 'package:flutter/material.dart';
import 'package:flutter_retrofit/providers/auth_state_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).getTokens();
              },
              child: const Text("Get Tokens"),
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final authStateNotifier =
                    ref.watch(authNotifierProvider.notifier);
                return ElevatedButton(
                    onPressed: () {
                      authStateNotifier.signOut();
                      Routemaster.of(context).replace('/');
                    },
                    child: const Text("Logout"));
              },
            ),
            ElevatedButton(
              onPressed: () {
                Routemaster.of(context).replace('/groups');
              },
              child: const Text("Get Groups"),
            ),
          ],
        ),
      ),
    );
  }
}
