
import 'package:flutter_retrofit/repository/group_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dio_provider.dart';

final groupRepositoryProvider = Provider<GroupRepository>((ref) {
  final groupApiService = ref.watch(utkorshoApiClientForCSProvider);
  return GroupRepository(groupApiService);
});