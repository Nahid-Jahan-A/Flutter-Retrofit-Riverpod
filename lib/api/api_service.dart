import 'package:dio/dio.dart';
import 'package:flutter_retrofit/model/post.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

class Apis {
  static const String posts = "/posts";
}

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.posts)
  Future<List<Post>> getPost();
}
