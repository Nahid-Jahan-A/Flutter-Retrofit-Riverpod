import 'package:flutter/cupertino.dart';
import 'package:flutter_retrofit/api/api_service.dart';
import 'package:flutter_retrofit/models/auth_data.dart';
import 'package:flutter_retrofit/providers/dio_provider.dart';
import 'package:flutter_retrofit/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { initial, loading, loaded, error }

class AuthState {
  const AuthState(
      {required this.isAuthenticated,
      this.accessToken,
      this.error,
      this.status});

  final bool isAuthenticated;
  final String? accessToken;
  final AuthStatus? status;
  final String? error;

  factory AuthState.unknown() => const AuthState(isAuthenticated: false);

  factory AuthState.authenticated(String accessToken) =>
      AuthState(isAuthenticated: true, accessToken: accessToken);

  factory AuthState.unauthenticated() =>
      const AuthState(isAuthenticated: false);

  AuthState copyWith({
    bool? isAuthenticated,
    String? accessToken,
    AuthStatus? status,
    String? error,
  }) {
    return AuthState(
      isAuthenticated: this.isAuthenticated,
      accessToken: accessToken ?? this.accessToken,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthStateNotifier(this._authRepository) : super(AuthState.unknown()) {
    _initialize();
  }

  Future<void> _initialize() async {
    Logger logger = Logger();
    final sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.get('accessToken');
    logger.i("Init Access Token --> $accessToken");
    if (accessToken != null) {
      state = AuthState.authenticated(accessToken.toString());
    } else {
      state = AuthState.unauthenticated();
    }
  }

  Future<void> setAccessToken(String accessToken, String refreshToken) async {
    Logger logger = Logger();
    state = AuthState.authenticated(accessToken);
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('accessToken', accessToken);
    await sharedPreferences.setString('refreshToken', refreshToken);

    logger.i("Access Token set ---> ${sharedPreferences.get('accessToken')}");
    logger.i("Refresh Token set ---> ${sharedPreferences.get('refreshToken')}");
  }

  Future<void> getTokens() async {
    Logger logger = Logger();
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.get('accessToken');
    sharedPreferences.get('refreshToken');

    logger.i("Access Token get ---> ${sharedPreferences.get('accessToken')}");
    logger.i("Refresh Token get ---> ${sharedPreferences.get('refreshToken')}");
  }

  Future<void> signOut() async {
    Logger logger = Logger();
    state = AuthState.unauthenticated();
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('accessToken');
    await sharedPreferences.remove('refreshToken');
    logger
        .i("Access token cleared ---> ${sharedPreferences.get("accessToken")}");
    logger.i(
        "Refresh token cleared ---> ${sharedPreferences.get("refreshToken")}");
  }

  Future<void> fetchAuthData({
    required String loginId,
    required String password,
  }) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    Logger logger = Logger();
    Map<String, dynamic> payload = {"loginId": loginId, "password": password};
    logger.i(payload);
    try {
      state = state.copyWith(status: AuthStatus.loading);
      final data = await _authRepository.getAuth(payload);
      logger.i("Access token ${data.data.accessToken.runtimeType}");
      state = state.copyWith(isAuthenticated: true);
      setAccessToken(data.data.accessToken, data.data.refreshToken);
    } catch (e) {
      state = state.copyWith(status: AuthStatus.error, error: e.toString());
      logger.i(e.toString());
    }
  }
}
