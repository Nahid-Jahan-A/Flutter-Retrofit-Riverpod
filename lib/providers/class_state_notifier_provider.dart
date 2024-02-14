import 'package:flutter_retrofit/providers/class_repository_provider.dart';
import 'package:flutter_retrofit/states/class_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final classNotifierProvider =
    StateNotifierProvider<ClassStateNotifier, ClassState>((ref) {
  final classRepository = ref.watch(classRepositoryProvider);
  return ClassStateNotifier(classRepository);
});
