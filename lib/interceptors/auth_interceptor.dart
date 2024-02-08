import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  final String authToken;

  AuthInterceptor(this.authToken);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers['requires-token'] == true) {
      final prefs = await SharedPreferences.getInstance();
      final authToken = prefs.get('auth-token');
      options.headers.addAll({"Authorization": "$authToken"});
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final responseData = response.data;
    if (responseData is Map &&
        (responseData.keys.every(
            (element) => ['success', 'data', 'meta'].contains(element)))) {
      return handler.next(response);
    }
    return handler.reject(
      DioException(
        requestOptions: response.requestOptions,
        error: 'The response is not in valid format',
      ),
    );
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // err.response. = Response(requestOptions: err.requestOptions, statusCode: 401);
    if (err.response?.statusCode == 401) {
      // navigate to the authentication screen
      return handler.reject(
        DioException.connectionError(
          requestOptions: err.requestOptions,
          error: 'The user has been deleted or the session is expired',
          reason: 'Status code 401',
        ),
      );
    }
    return handler.next(err);
  }
}
