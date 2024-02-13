

import 'package:flutter_retrofit/api/api_service.dart';
import 'package:flutter_retrofit/models/group_data.dart';

class GroupRepository {
  final UtkorshoApiClientForCS _utkorshoApiClientForCS;

  GroupRepository(this._utkorshoApiClientForCS);

  Future<GroupData> getGroups() async {
    return _utkorshoApiClientForCS.getGroupData();
  }

  Future<Group> createNewGroup(payload) async {
    return _utkorshoApiClientForCS.addGroup(payload);
  }
}