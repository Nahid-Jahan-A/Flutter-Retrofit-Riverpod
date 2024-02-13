import 'package:flutter/material.dart';
import 'package:flutter_retrofit/providers/group_state_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/group_state.dart';

class GroupScreen extends ConsumerWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Groups"),
        actions: [
          IconButton(
              onPressed: () {
                //showSearch(context: context, delegate: GroupSearchDelegate());
              },
              icon: Icon(Icons.search))
        ],
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

// class GroupSearchDelegate extends SearchDelegate<String> {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: Icon(Icons.clear),
//       )
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return Consumer(builder: (context, WidgetRef ref, child) {
//       final state = ref.read(groupNotifierProvider);
//       return IconButton(
//           onPressed: () {
//             close(context, ref);
//           },
//           icon: Icon(Icons.arrow_back));
//     });
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // List<String> matchQuery = [];
//     // for (var name in searchTerms) {
//     //   if (name.toLowerCase().contains(query.toLowerCase())) {
//     //     matchQuery.add(name);
//     //   }
//     //}
//     return _buildSearchResults(context);
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // List<String> matchQuery = [];
//     // for (var name in searchTerms) {
//     //   if (name.toLowerCase().contains(query.toLowerCase())) {
//     //     matchQuery.add(name);
//     //   }
//     // }
//     return _buildSearchResults(context);
//   }
//
//   Widget _buildSearchResults(BuildContext context) {
//     final state = context.read(groupNotifierProvider);
//     final filteredGroups = state.groups
//         .where(
//             (group) => group.name.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//
//     return ListView.builder(
//       itemCount: filteredGroups.length,
//       itemBuilder: (context, index) {
//         final group = filteredGroups[index];
//         return ListTile(
//           title: Text(group.name),
//           subtitle: Text(group.status.toString()),
//         );
//       },
//     );
//   }
// }
