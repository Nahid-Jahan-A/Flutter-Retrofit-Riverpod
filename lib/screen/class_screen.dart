import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/class_state_notifier_provider.dart';
import '../states/class_state.dart';

class ClassScreen extends StatelessWidget {
  const ClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Classes"),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(classNotifierProvider);
          return _buildContent(state);
        },
      ),
    );
  }
}

Widget _buildContent(ClassState state) {
  switch (state.status) {
    case ClassStatus.loading:
      return const Center(child: CircularProgressIndicator());
    case ClassStatus.loaded:
      return ListView.builder(
        itemCount: state.classes.length,
        itemBuilder: (context, index) {
          final classes = state.classes[index];
          return ListTile(
            title: Text(classes.classTitleEnglish),
            subtitle: Text(classes.status),
            leading: Text(classes.id),
          );
        },
      );
    case ClassStatus.error:
      return Center(child: Text('Error: ${state.error}'));
    default:
      return const Center(child: Text('No data available'));
  }
}
