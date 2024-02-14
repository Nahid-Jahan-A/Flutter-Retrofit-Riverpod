
import 'package:flutter/cupertino.dart';
import 'package:flutter_retrofit/states/group_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'group_repository_provider.dart';

final groupNotifierProvider =
StateNotifierProvider<GroupStateNotifier, GroupState>((ref) {
  debugPrint("CALLED_ONE");
  final groupRepository = ref.watch(groupRepositoryProvider);
  debugPrint("CALLED_TWO");
  return GroupStateNotifier(groupRepository);
});