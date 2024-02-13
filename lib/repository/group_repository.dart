

import 'package:flutter_retrofit/api/api_service.dart';
import 'package:flutter_retrofit/models/Groups.dart';

class GroupRepository {
  final UtkorshoApiClientForCS _utkorshoApiClientForCS;

  GroupRepository(this._utkorshoApiClientForCS);

  Future<GroupData> getGroups() async {
    return _utkorshoApiClientForCS.getGroupData();
  }
}