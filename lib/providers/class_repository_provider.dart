import 'package:flutter_retrofit/providers/dio_provider.dart';
import 'package:flutter_retrofit/repository/class_repository.dart';
import 'package:flutter_retrofit/states/class_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final classRepositoryProvider = Provider<ClassRepository>((ref) {
  final classApiService = ref.watch(utkorshoApiClientForClassProvider);
  return ClassRepository(classApiService);
});
