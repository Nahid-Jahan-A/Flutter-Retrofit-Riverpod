//This will go inside provider module
import 'package:flutter_retrofit/providers/auth_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/auth_state.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthStateNotifier(authRepository);
});
