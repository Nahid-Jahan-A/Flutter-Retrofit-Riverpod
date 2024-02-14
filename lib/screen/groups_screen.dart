import 'package:flutter/material.dart';
import 'package:flutter_retrofit/providers/group_state_notifier_provider.dart';
import 'package:flutter_retrofit/repository/post_state.dart';
import 'package:flutter_retrofit/screen/single_group_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_context/riverpod_context.dart';
import 'package:routemaster/routemaster.dart';

import '../providers/group_repository_provider.dart';
import '../states/group_state.dart';

class GroupScreen extends ConsumerStatefulWidget {
  const GroupScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GroupScreen();
}

class _GroupScreen extends ConsumerState<GroupScreen> {
  final TextEditingController _groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Groups"),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final groupState = ref.watch(groupNotifierProvider);
          return Padding(
            padding: const EdgeInsets.all(58.0),
            child: _buildContent(groupState),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreatePostDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCreatePostDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create Group'),
          content: TextField(
            controller: _groupNameController,
            decoration: const InputDecoration(labelText: 'Enter group name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                Logger logger = Logger();
                final text = _groupNameController.text.trim();
                if (text.isNotEmpty) {
                  final groupState = ref.read(groupNotifierProvider.notifier);
                  await groupState.createNewGroup(groupName: text);
                  logger.i(
                      "Value of group status -----> ${ref.read(groupNotifierProvider).status == GroupStatus.created}");
                  logger.i("Context Mounted?-----------> ${context.mounted}");
                  if (context.mounted &&
                      ref.read(groupNotifierProvider).status ==
                          GroupStatus.created) {
                    Navigator.pop(context);
                    groupState.fetchGroupData();
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter group name')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContent(GroupState state) {
    switch (state.status) {
      case GroupStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case GroupStatus.loaded:
        return ListView.builder(
          itemCount: state.data.length,
          itemBuilder: (context, index) {
            final group = state.data[index];
            return ListTile(
              onTap: () async {
                Logger logger = Logger();
                final groupState = ref.watch(groupNotifierProvider.notifier);
                await groupState.getGroupById(group.id.toString());
                logger.i("Group state status------> ${ref.watch(groupNotifierProvider).status}");
                if(ref.watch(groupNotifierProvider).status == GroupStatus.loadedSingle) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingleGroupScreen(group: group,),
                    ),
                  );
                }
              },
              title: Text(group.name),
              subtitle: Text(group.status.toString()),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _showDeleteConfirmationDialog(context, group.id),
              ),
            );
          },
        );
      case GroupStatus.error:
        return Center(child: Text('Error: ${state.error}'));
      default:
        return const Center(child: Text('No data available'));
    }
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context, id) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this group?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async{
                // final groupState = ref.read(groupNotifierProvider.notifier);
                // groupState.deleteGroupById(id);
                debugPrint("DELETE_ID $id");
                final groupState = ref.read(groupNotifierProvider.notifier);
                await groupState.deleteGroupById(id.toString());
                if (context.mounted &&
                    ref.read(groupNotifierProvider).status ==
                        GroupStatus.deleted) {
                  Navigator.pop(context);
                  await groupState.fetchGroupData();
                }
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
