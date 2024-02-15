import 'package:dio/dio.dart';
import 'package:flutter_retrofit/api/api_service.dart';
import 'package:flutter_retrofit/interceptors/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider((ref) => Dio(
      BaseOptions(contentType: "application/json"),
    ));

final dioInterceptorProvider = Provider((ref) => DioClient().api);

final apiClientProvider = Provider((ref) => ApiClient(ref.watch(dioProvider)));

final utkorshoApiClientProvider =
    Provider((ref) => UtkorshoApiClient(ref.watch(dioInterceptorProvider)));

final utkorshoApiClientForCSProvider =
    Provider((ref) => UtkorshoApiClientForCS(ref.watch(dioProvider)));

final utkorshoApiClientForClassProvider =
    Provider((ref) => UtkorshoApiClientForClass(ref.watch(dioProvider)));
