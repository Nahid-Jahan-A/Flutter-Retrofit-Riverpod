import 'package:flutter_retrofit/repository/class_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../models/class.dart';

enum ClassStatus { initial, loading, loaded, error }

class ClassState {
  ClassState({required this.classes, required this.status, this.error});

  final List<Class> classes;
  final ClassStatus status;
  final String? error;

  factory ClassState.initial() {
    return ClassState(classes: [], status: ClassStatus.initial);
  }
  ClassState copyWith({
    List<Class>? classes,
    ClassStatus? status,
    String? error,
  }) {
    return ClassState(
      classes: classes ?? this.classes,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}

class ClassStateNotifier extends StateNotifier<ClassState> {
  final ClassRepository _classRepository;

  ClassStateNotifier(this._classRepository) : super(ClassState.initial()) {
    fetchClassData();
  }

  Future<void> fetchClassData() async {
    Logger logger = Logger();

    logger.i(
        "================================ Inside fetch group method ========================================");

    try {
      state = state.copyWith(status: ClassStatus.loading);
      final classes = await _classRepository.getClasses();
      logger.i("Class data ${classes.data}");
      state = state.copyWith(classes: classes.data, status: ClassStatus.loaded);
    } catch (e) {
      state = state.copyWith(status: ClassStatus.error, error: e.toString());
    }
  }
}
