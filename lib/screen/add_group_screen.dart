import 'package:flutter/material.dart';
import 'package:flutter_retrofit/providers/group_state_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AddGroup extends ConsumerStatefulWidget {
  const AddGroup({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddGroupState();
}

class _AddGroupState extends ConsumerState<AddGroup> {
  final TextEditingController _groupNameController = TextEditingController();

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  void _handleGroupCreate() {
    final notifier = ref.read(groupNotifierProvider.notifier);
    String groupName = _groupNameController.text.trim();
    notifier.createNewGroup(groupName: groupName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Group"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _groupNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter group name")
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () {
              _handleGroupCreate();
            }, child: const Text("Add")),
          ],
        ),
      ),
    );
  }
}

