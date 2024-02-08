import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  Dio api = Dio();
  String? accessToken;

  DioClient() {
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      // if (!options.path.contains('http')) {
      //   options.path = 'http://10.10.10.31:38080${options.path}';
      // }
      // options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    }, onError: (DioException error, handler) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      //also check if error.response?.data['message'] == "Invalid JWT"
      if (error.response?.statusCode == 401) {
        if (prefs.containsKey('refreshToken')) {
          await refreshToken();
          return handler.resolve(await _retry(error.requestOptions));
        }
      }
      return handler.next(error);
    }));
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options =
        Options(method: requestOptions.method, headers: requestOptions.headers);
    return api.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<void> refreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.get('refreshToken');
    final response =
        await api.post('/auth/refresh', data: {'refreshToken': refreshToken});

    if (response.statusCode == 201) {
      accessToken = response.data;
    } else {
      accessToken = null;
      prefs.clear();
    }
  }
}
