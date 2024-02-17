import 'package:flutter_retrofit/repository/group_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

enum GroupStatus {
  initial,
  loading,
  created,
  updated,
  deleted,
  loaded,
  loadedSingle,
  error
}

class GroupState<T> {
  GroupState({required this.data, required this.status, this.error});

  final T? data;
  final GroupStatus status;
  final String? error;

  factory GroupState.initial() {
    return GroupState(data: null, status: GroupStatus.initial);
  }

  GroupState<T> copyWith({
    T? groups,
    GroupStatus? status,
    String? error,
  }) {
    return GroupState<T>(
      data: groups ?? this.data,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}

class GroupStateNotifier extends StateNotifier<GroupState> {
  final GroupRepository _groupRepository;

  GroupStateNotifier(this._groupRepository) : super(GroupState.initial()) {
    fetchGroupData();
  }

  Future<void> fetchGroupData() async {
    Logger logger = Logger();

    logger.i(
        "================================ Inside fetch group method ========================================");

    try {
      state = state.copyWith(status: GroupStatus.loading);
      final groups = await _groupRepository.getGroups();
      logger.i("Group data ${groups.data}");
      state = state.copyWith(groups: groups.data, status: GroupStatus.loaded);
    } catch (e) {
      state = state.copyWith(status: GroupStatus.error, error: e.toString());
      logger.i(e.toString());
    }
  }

  Future<void> createNewGroup({required String groupName}) async {
    Logger logger = Logger();

    logger.i(
        "================================ Inside create group method ========================================");

    logger.i(groupName);
    try {
      state = state.copyWith(status: GroupStatus.loading);
      Map<String, dynamic> payload = {"name": groupName};
      final data = await _groupRepository.createNewGroup(payload);
      if (data.meta?.statusCode == 201) {
        logger.i("Newly created group data ----->  ${data.data.name}");
        state = state.copyWith(status: GroupStatus.created);
        logger.i("Group Created Successfully ----->");
        logger.i(
            "State value from method inside view model -----> ${state.status}");
      }
    } catch (e) {
      state = state.copyWith(status: GroupStatus.error);
      logger.i(e.toString());
    }
  }

  Future<void> deleteGroupById(String id) async {
    Logger logger = Logger();

    logger.i(
        "================================ Inside delete group method ========================================");

    try {
      state = state.copyWith(status: GroupStatus.loading);
      final data = await _groupRepository.deleteGroupById(id);
      if (data.meta?.statusCode == 200) {
        state = state.copyWith(status: GroupStatus.deleted);
        logger.i("Group deleted successfully");
      } else {
        throw Exception(
            "Failed to delete group. Status code: ${data.meta?.statusCode}");
      }
    } catch (e) {
      logger.e("Error deleting group: $e");
      state = state.copyWith(status: GroupStatus.error);
    }
  }

  Future<void> getGroupById(id) async {
    Logger logger = Logger();

    logger.i(
        "================================ Inside get group by ID method ========================================");

    logger.i(id);

    try {
      logger.i("Inside try block");
      state = state.copyWith(status: GroupStatus.loading);
      logger.i("Group status ${state.status}");
      final data =
          await _groupRepository.getGroupByGroupId(id).then((value) {
        logger.i(value);
        return value;
      });
      if (data.meta?.statusCode == 200) {
        logger.i("Get group data status ----->  ${data.success}");
        state = state.copyWith(status: GroupStatus.loadedSingle);
      }
    } catch (e) {
      logger.e("Inside catch block ${e.toString()}");
      state = state.copyWith(status: GroupStatus.error);
    }
  }
}
