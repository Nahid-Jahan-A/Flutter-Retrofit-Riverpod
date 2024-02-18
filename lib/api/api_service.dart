import 'package:dio/dio.dart';
import 'package:flutter_retrofit/model_practice/post.dart';
import 'package:flutter_retrofit/models/api_response.dart';
import 'package:flutter_retrofit/models/auth.dart';
import 'package:flutter_retrofit/models/class_data.dart';
import 'package:retrofit/http.dart';

import '../models/group.dart';
import '../util/apis.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Apis.POSTS_BASE_URL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.posts)
  Future<List<Post>> getPost();
}

@RestApi(baseUrl: Apis.UTKORSHO_BASE_URL_CS)
abstract class UtkorshoApiClientForCS {
  factory UtkorshoApiClientForCS(Dio dio, {String baseUrl}) = _UtkorshoApiClientForCS;

  @GET(Apis.group_endpoint)
  Future<ApiResponse<List<Group>>> getGroupData();

  @POST(Apis.add_group_endpoint)
  Future<ApiResponse<Group>> addGroup(@Body() group);

  @PUT(Apis.edit_group_endpoint)
  Future<ApiResponse<Group>> editGroup(@Path("groupId") groupId, @Body() groupName);

  @DELETE(Apis.delete_group_endpoint)
  Future<ApiResponse> deleteGroup(@Path("groupId") String groupId);

  @GET(Apis.get_single_group_endpoint)
  Future<ApiResponse<Group>> getGroupByGroupId(@Path("groupId") String groupId);
  
  @GET(Apis.class_endpoint)
  Future<ApiResponse<List<ClassData>>> getClassData();
  
  @POST(Apis.class_endpoint)
  Future<ClassData> createClass(@Body() payload);

}

@RestApi(baseUrl: Apis.UTKORSHO_BASE_URL)
abstract class UtkorshoApiClient {
  factory UtkorshoApiClient(Dio dio, {String baseUrl}) = _UtkorshoApiClient;

  @POST(Apis.auth_login)
  Future<ApiResponse<Auth>> login(@Body() payload);
}

