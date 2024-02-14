import 'package:flutter/material.dart';
import 'package:flutter_retrofit/models/group_data.dart';

class SingleGroupScreen extends StatelessWidget {
  final CreateGroupResponse group;

  const SingleGroupScreen({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Group Name: ${group.data.name}',
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 15,),

            Text(
              'Group ID: ${group.data.id}',
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 15,),

            Text(
              'Group Status: ${group.data.status}',
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
