
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_retrofit/providers/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api/api_service.dart';
import 'model/post.dart';

final postProvider = StateNotifierProvider<PostsNotifier, PostState>(
    (ref) => PostsNotifier(ref.watch(apiClientProvider)),
);

@immutable
abstract class PostState{}

class InitialPostState extends PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<Post> posts;

  PostLoadedState({required this.posts});
}

class ErrorPostState extends PostState{
  final String message;
  ErrorPostState({required this.message});
}

class PostsNotifier extends StateNotifier<PostState> {
  final ApiClient _apiClient;
  PostsNotifier(this._apiClient) : super(InitialPostState());

  void fetchPosts() async {
    try {
      print("inside fetch try");
      state = PostLoadingState();
      List<Post> posts = await _apiClient.getPost();
      print(posts.length.toString());
      state = PostLoadedState(posts: posts);
      log("api called");
      print("inside fetch try");
    } catch(e) {
      print("inside catch try");
      state = ErrorPostState(message: e.toString());
    }
  }
}