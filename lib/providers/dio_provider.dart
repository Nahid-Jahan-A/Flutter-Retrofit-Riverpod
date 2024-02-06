import 'package:dio/dio.dart';
import 'package:flutter_retrofit/api/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider(
        (ref) => Dio(
      BaseOptions(contentType: "application/json"),
    ));

final apiClientProvider = Provider(
        (ref) => ApiClient(
            ref.watch(dioProvider)
        ));
