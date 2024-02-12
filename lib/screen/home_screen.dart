

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_retrofit/model/post.dart';
import 'package:flutter_retrofit/repository/post_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostState state = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Posts"),
      ),
      body: Center(
        child: switch(state) {
        (InitialPostState _) => const Text("Click to fetch post data"),
        (PostLoadingState _) => const CircularProgressIndicator(),
        (PostLoadedState state) => _buildPostsView(state),
        _ => const Text("Something went wrong")
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(postProvider.notifier).fetchPosts();
        },
        child: const Icon(Icons.add_circle_outline),
      ),
    );
  }
}

Widget _buildPostsView(PostLoadedState state) {
  return ListView.builder(
    itemCount: state.posts.length,
      itemBuilder: (context, index) {
        Post post = state.posts[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text(post.id.toString()),
          ),
          title: Text(post.title),
          subtitle: Text(post.body),
        );
      },
  );
}