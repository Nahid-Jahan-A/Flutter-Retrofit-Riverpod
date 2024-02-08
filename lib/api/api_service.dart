import 'package:dio/dio.dart';
import 'package:flutter_retrofit/model/auth_data.dart';
import 'package:flutter_retrofit/model/post.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

class Apis {
  static const String posts = "/posts";

  static const String POSTS_BASE_URL = "https://jsonplaceholder.typicode.com";

  static const String UTKORSHO_BASE_URL = "http://10.10.10.31:38080";

  static const String auth_endpoint = "/auth/login"; //post method requires login id and password

  static const String test_endpoint = "/api/v1/hello"; //get method requires access token in the header
}

@RestApi(baseUrl: Apis.POSTS_BASE_URL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.posts)
  Future<List<Post>> getPost();
}

@RestApi(baseUrl: Apis.UTKORSHO_BASE_URL)
abstract class UtkorshoApiClient {
  factory UtkorshoApiClient(Dio dio, {String baseUrl}) = _UtkorshoApiClient;

  @POST(Apis.auth_endpoint)
  Future<AuthData> login(@Body() payload);
}
