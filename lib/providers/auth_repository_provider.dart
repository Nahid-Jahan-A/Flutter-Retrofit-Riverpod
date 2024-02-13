import 'package:flutter_retrofit/providers/dio_provider.dart';
import 'package:flutter_retrofit/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authApiService = ref.watch(utkorshoApiClientProvider);
  return AuthRepository(authApiService);
});
