import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myProvider = Provider<String>((ref) => "Riverpod provider");


class ProviderWidget extends ConsumerWidget {
  const ProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myProviderName = ref.watch(myProvider);
    return Scaffold(
      body: Center(
        child: Text(myProviderName.toString()),
      ),
    );
  }
}
