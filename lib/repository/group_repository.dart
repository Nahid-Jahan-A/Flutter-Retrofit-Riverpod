import 'package:flutter_retrofit/api/api_service.dart';
import 'package:flutter_retrofit/models/group_data.dart';
import 'package:logger/logger.dart';

import '../models/class.dart';

class GroupRepository {
  final UtkorshoApiClientForCS _utkorshoApiClientForCS;

  GroupRepository(this._utkorshoApiClientForCS);

  Future<GroupData> getGroups() async {
    return _utkorshoApiClientForCS.getGroupData();
  }

  Future<CreateGroupResponse> createNewGroup(payload) async {
    Logger logger = Logger();
    logger.i("Logging the payload from repo ====> $payload");
    final group = await _utkorshoApiClientForCS.addGroup(payload);
    return group;
  }

  Future<DeleteResponse> deleteGroupById(String id) async{
    Logger logger = Logger();
    logger.i("Logging from delete group method -----> $id");
    final metaData = await _utkorshoApiClientForCS.deleteGroup(id);
    return metaData;
  }

  Future<SingleGroupResponse> getGroupByGroupId(id) async{
    Logger logger = Logger();
    logger.i("Logging from get single group method -----> $id");
    final group = await _utkorshoApiClientForCS.getGroupByGroupId(id);
    return group;
  }
}



