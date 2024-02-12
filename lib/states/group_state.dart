import 'package:flutter_retrofit/data_classes/Groups.dart';
import 'package:flutter_retrofit/repository/group_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

enum GroupStatus { initial, loading, loaded, error }

class GroupState {
  GroupState({required this.groups, required this.status, this.error});

  final List<Group> groups;
  final GroupStatus status;
  final String? error;

  factory GroupState.initial() {
    return GroupState(groups: [], status: GroupStatus.initial);
  }

  GroupState copyWith({
    List<Group>? groups,
    GroupStatus? status,
    String? error,
  }) {
    return GroupState(
      groups: groups ?? this.groups,
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

    logger.i("================================ Inside fetch group method ========================================");

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
}
