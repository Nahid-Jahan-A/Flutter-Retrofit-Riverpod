import 'package:flutter_retrofit/models/api_response.dart';
import 'package:flutter_retrofit/models/class_data.dart';
import 'package:flutter_retrofit/repository/class_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

enum ClassStatus { initial, loading, loaded, error }

class ClassState<T> {
  ClassState({required this.data, required this.status, this.error});

  final T? data;
  final ClassStatus status;
  final String? error;

  factory ClassState.initial() {
    return ClassState(status: ClassStatus.initial, data: null);
  }
  ClassState copyWith({
    ApiResponse<List<ClassData>>? classes,
    ClassStatus? status,
    String? error,
  }) {
    return ClassState(
      data: classes ?? this.data,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}

class ClassStateNotifier extends StateNotifier<ClassState> {
  final ClassRepository _classRepository;

  ClassStateNotifier(this._classRepository) : super(ClassState.initial()) {
    fetchGroupData();
  }

  Future<void> fetchGroupData() async {
    Logger logger = Logger();

    logger.i(
        "================================ Inside fetch group method ========================================");

    try {
      state = state.copyWith(status: ClassStatus.loading);
      final classes = await _classRepository.getClasses();
      logger.i("Group data ${classes.data}");
      state = state.copyWith(classes: classes.data, status: ClassStatus.loaded);
    } catch (e) {
      state = state.copyWith(status: ClassStatus.error, error: e.toString());
      logger.i(e.toString());
    }
  }
}
