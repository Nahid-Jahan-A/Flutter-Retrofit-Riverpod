import 'package:freezed_annotation/freezed_annotation.dart';
import 'meta.dart';
part 'api_response.freezed.dart';
part 'api_response.g.dart';


@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse {
  const factory ApiResponse({
    bool? success,
    T? data,
    Meta? meta,
}) = _ApiResponse;

  factory ApiResponse.fromJson(
      Map<String, Object?> json, T Function(Object?) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
}


