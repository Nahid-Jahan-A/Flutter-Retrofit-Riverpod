import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateProvider = StateProvider.autoDispose<int>((ref) => 0);

class StateProviderWidget extends ConsumerWidget {
  const StateProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(stateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("State Provider"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(stateProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          count.toString(),
          style: TextStyle(
            color: Colors.amber,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
