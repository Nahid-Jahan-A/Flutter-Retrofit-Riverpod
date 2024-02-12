import 'package:flutter/material.dart';
import 'package:flutter_retrofit/providers/group_state_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/group_state.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Groups"),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              ref.read(groupNotifierProvider.notifier).fetchGroupData();
            },
          );
        }
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final state = watch.watch(groupNotifierProvider);
          return _buildContent(state);
        },
      ),
    );
  }

  Widget _buildContent(GroupState state) {
    switch (state.status) {
      case GroupStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case GroupStatus.loaded:
        return ListView.builder(
          itemCount: state.groups.length,
          itemBuilder: (context, index) {
            final group = state.groups[index];
            return ListTile(
              title: Text(group.name),
              subtitle: Text(group.status.toString()),
            );
          },
        );
      case GroupStatus.error:
        return Center(child: Text('Error: ${state.error}'));
      default:
        return const Center(child: Text('No data available'));
    }
  }

}
