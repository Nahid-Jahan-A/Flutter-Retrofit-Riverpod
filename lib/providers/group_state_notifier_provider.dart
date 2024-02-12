
import 'package:flutter_retrofit/states/group_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'group_repository_provider.dart';

final groupNotifierProvider =
StateNotifierProvider<GroupStateNotifier, GroupState>((ref) {
  final groupRepository = ref.watch(groupRepositoryProvider);
  return GroupStateNotifier(groupRepository);
});