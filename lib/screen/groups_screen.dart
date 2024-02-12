import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/group_statedart';

class GroupScreen extends ConsumerWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(groupNotifierProvider.notifier).fetchGroupData();
    return Scaffold(
      appBar: AppBar(title: const Text("Groups"),),
      body: const Center(
        child: Text(""),
      ),
    );
  }
}
