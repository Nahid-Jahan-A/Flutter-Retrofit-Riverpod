import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_retrofit/api/api_service.dart';
import 'package:flutter_retrofit/model/auth_data.dart';
import 'package:flutter_retrofit/providers/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
abstract class AuthState {}

class InitialAuthState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {
  final AuthData data;

  AuthLoadedState({required this.data});
}

class ErrorAuthState extends AuthState {
  final String message;

  ErrorAuthState({required this.message});
}

final authStateNotifier = StateNotifierProvider(
  (ref) => AuthNotifier(
    UtkorshoApiClient(
      ref.read(dioProvider),
    ),
  ),
);

class AuthNotifier extends StateNotifier<AuthState> {
  final UtkorshoApiClient _apiClient;

  AuthNotifier(this._apiClient) : super(InitialAuthState());

  void fetchAuthData({
    required String loginId,
    required String password,
}) async {
    Map<String, dynamic> payload = {
      "loginId": loginId,
      "password": password
    };
    try {
      state = AuthLoadingState();
      AuthData data = await _apiClient.login(payload);
      state = AuthLoadedState(data: data);
      log("api called");
    } catch (e) {
      state = ErrorAuthState(message: e.toString());
    }
  }
}
