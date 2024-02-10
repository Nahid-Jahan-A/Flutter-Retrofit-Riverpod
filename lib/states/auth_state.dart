import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_retrofit/api/api_service.dart';
import 'package:flutter_retrofit/model/auth_data.dart';
import 'package:flutter_retrofit/providers/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/global_values.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(utkorshoApiClientProvider)),
);

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
      ref.read(dioInterceptorProvider),
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
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    Logger logger = Logger();
    Map<String, dynamic> payload = {"loginId": loginId, "password": password};
    logger.i(payload);
    try {
      state = AuthLoadingState();
      AuthData data = await _apiClient.login(payload);
      logger.i("Access token ${data.data.accessToken.runtimeType}");
      // logger.i("Refresh token ${data.data.refreshToken}");
      // accessToken = prefs.setString('accessToken', data.data.accessToken);
      // refreshToken = prefs.setString('refreshToken', data.data.refreshToken);
      // logger.i(prefs.get('accessToken'));
      // logger.i(prefs.get('refreshToken'));
      state = AuthLoadedState(data: data);
      _saveResponseData(AuthLoadedState(data: data));
    } catch (e) {
      state = ErrorAuthState(message: e.toString());
      logger.i(e.toString());
    }
  }

  void _saveResponseData(AuthLoadedState state) async{
    Logger logger = Logger();
    AuthData data = state.data;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('accessToken', data.data.accessToken);
    if(prefs.get('accessToken') != null) flag = true;
    prefs.setString('refreshToken', data.data.refreshToken);

    logger.i(prefs.get('accessToken'));
    logger.i(prefs.get('refreshToken'));
  }

}
