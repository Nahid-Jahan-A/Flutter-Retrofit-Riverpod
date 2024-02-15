import 'package:flutter/material.dart';
import 'package:flutter_retrofit/models/group_data.dart';
import 'package:flutter_retrofit/providers/group_state_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SingleGroupScreen extends ConsumerWidget {
  final String groupId;

  const SingleGroupScreen({super.key, required this.groupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Details'),
      ),
      body: Center(
        child: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Text("");
        },
        ),
      ),
    );
  }
}
