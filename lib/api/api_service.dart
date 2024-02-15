import 'package:dio/dio.dart';
import 'package:flutter_retrofit/models/group_data.dart';
import 'package:flutter_retrofit/models/auth_data.dart';
import 'package:flutter_retrofit/model_practice/post.dart';
import 'package:flutter_retrofit/models/class.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

class Apis {
  static const String posts = "/posts";

  static const String POSTS_BASE_URL = "https://jsonplaceholder.typicode.com";

  static const String UTKORSHO_BASE_URL = "http://10.10.10.31:38080";


  static const String class_endpoint = "/api/v1/classes";

  
  static const String UTKORSHO_BASE_URL_CS = "http://10.10.10.31:28089/course-service/";

  static const String auth_endpoint = "/auth/login"; //post method requires login id and password

  static const String group_endpoint = "api/v1/groups";

  static const String add_group_endpoint = "api/v1/groups"; //post method requires group name as payload


  static const String delete_group_endpoint = "api/v1/groups/{groupId}"; //post method requires group id as payload

  static const String get_single_group_endpoint = "api/v1/groups/{groupId}"; //post method requires group id as payload

  static const String test_endpoint = "/api/v1/hello"; //get method requires access token in the header
}

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
  Future<GroupData> getGroupData();

  @POST(Apis.add_group_endpoint)
  Future<CreateGroupResponse> addGroup(@Body() group);

  @DELETE(Apis.delete_group_endpoint)
  Future<DeleteResponse> deleteGroup(@Path("groupId") String groupId);

  @GET(Apis.get_single_group_endpoint)
  Future<SingleGroupResponse> getGroupByGroupId(@Path("groupId") String groupId);
  
  @GET(Apis.class_endpoint)
  Future<ClassData> getClassData();
  
  @POST(Apis.class_endpoint)
  Future<ClassData> getClassData(@Body() payload);

}

@RestApi(baseUrl: Apis.UTKORSHO_BASE_URL)
abstract class UtkorshoApiClient {
  factory UtkorshoApiClient(Dio dio, {String baseUrl}) = _UtkorshoApiClient;

  @POST(Apis.auth_endpoint)
  Future<AuthData> login(@Body() payload);
}

