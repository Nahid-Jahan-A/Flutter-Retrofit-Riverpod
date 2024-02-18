import 'package:flutter_retrofit/api/api_service.dart';
import 'package:flutter_retrofit/models/api_response.dart';
import 'package:logger/logger.dart';

import '../models/group.dart';

class GroupRepository {
  final UtkorshoApiClientForCS _utkorshoApiClientForCS;

  GroupRepository(this._utkorshoApiClientForCS);

  Future<ApiResponse<List<Group>>> getGroups() async {
    return _utkorshoApiClientForCS.getGroupData();
  }

  Future<ApiResponse<Group>> createNewGroup(payload) async {
    Logger logger = Logger();
    logger.i("Logging the payload from repo ====> $payload");
    final group = await _utkorshoApiClientForCS.addGroup(payload);
    return group;
  }

  Future<ApiResponse> deleteGroupById(String id) async{
    Logger logger = Logger();
    logger.i("Logging from delete group method -----> $id");
    final metaData = await _utkorshoApiClientForCS.deleteGroup(id);
    return metaData;
  }

  Future<ApiResponse> editGroupById(String id, payload) async{
    Logger logger = Logger();
    logger.i("Logging from delete group method -----> $id");
    final metaData = await _utkorshoApiClientForCS.editGroup(id, payload);
    return metaData;
  }

  Future<ApiResponse<Group>> getGroupByGroupId(id) async{
    Logger logger = Logger();
    logger.i("Logging from get single group method -----> $id");
    final group = await _utkorshoApiClientForCS.getGroupByGroupId(id);
    return group;
  }
}



