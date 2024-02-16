import 'package:freezed_annotation/freezed_annotation.dart';
import 'meta.dart';
part 'api_response.freezed.dart';
part 'api_response.g.dart';


@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse {
  const factory ApiResponse({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'data') T? data,
    @JsonKey(name: 'meta') Meta? meta,
}) = _ApiResponse;

  factory ApiResponse.fromJson(
      Map<String, Object?> json, T Function(Object?) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
}


