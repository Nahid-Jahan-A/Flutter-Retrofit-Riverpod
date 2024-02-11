import 'package:flutter/cupertino.dart';
import 'package:flutter_retrofit/api/api_service.dart';
import 'package:flutter_retrofit/model/auth_data.dart';
import 'package:flutter_retrofit/providers/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(utkorshoApiClientProvider)),
);

@immutable
class AuthState {
  final bool isAuthenticated;
  final String? accessToken;

  const AuthState(this.isAuthenticated, {this.accessToken});

  factory AuthState.unknown() => const AuthState(false);

  factory AuthState.authenticated(String accessToken) =>
      AuthState(true, accessToken: accessToken);

  factory AuthState.unauthenticated() => const AuthState(false);
}

class InitialAuthState extends AuthState {
  const InitialAuthState(super.isAuthenticated);
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState(super.isAuthenticated);
}

class AuthLoadedState extends AuthState {
  final AuthData data;

  const AuthLoadedState(super.isAuthenticated, {required this.data});
}

class ErrorAuthState extends AuthState {
  final String message;

  const ErrorAuthState(super.isAuthenticated, {required this.message});
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

  AuthNotifier(this._apiClient) : super(AuthState.unknown()) {
    _initialize();
  }

  Future<void> _initialize() async {
    Logger logger = Logger();
    final sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.get('accessToken');
    logger.i("Access Token --> $accessToken");
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
    logger.i("Access token cleared ---> ${sharedPreferences.get("accessToken")}");
    logger.i("Refresh token cleared ---> ${sharedPreferences.get("refreshToken")}");
  }

  void fetchAuthData({
    required String loginId,
    required String password,
  }) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    Logger logger = Logger();
    Map<String, dynamic> payload = {"loginId": loginId, "password": password};
    logger.i(payload);
    try {
      state = const AuthLoadingState(false);
      AuthData data = await _apiClient.login(payload);
      logger.i("Access token ${data.data.accessToken.runtimeType}");
      // logger.i("Refresh token ${data.data.refreshToken}");
      // accessToken = prefs.setString('accessToken', data.data.accessToken);
      // refreshToken = prefs.setString('refreshToken', data.data.refreshToken);
      // logger.i(prefs.get('accessToken'));
      // logger.i(prefs.get('refreshToken'));
      state = AuthLoadedState(true, data: data);
      setAccessToken(data.data.accessToken, data.data.refreshToken);
    } catch (e) {
      state = ErrorAuthState(false, message: e.toString());
      logger.i(e.toString());
    }
  }

  void _saveResponseData(AuthLoadedState state) async {
    Logger logger = Logger();
    AuthData data = state.data;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('accessToken', data.data.accessToken);
    prefs.setString('refreshToken', data.data.refreshToken);

    logger.i(prefs.get('accessToken'));
    logger.i(prefs.get('refreshToken'));
  }
}
