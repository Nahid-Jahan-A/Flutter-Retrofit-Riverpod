import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_template.g.dart';
part 'data_template.freezed.dart';
//
// class Template<T> {
//   bool success;
//   T data;
//   Meta meta;
//
//   Template({
//     required this.success,
//     required this.data,
//     required this.meta,
//   });
//
//   factory Template.fromJson(Map<String, dynamic> json) {
//     return Template(success: json['success'], data: T.fromJson(json['data']), meta: Meta.fromJson(json['data']));
//   }
//
// }

@freezed
class Meta with _$Meta {
  const factory Meta({required int statusCode, String? message}) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@Freezed(genericArgumentFactories: true)
sealed class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required bool success,
    required T data,
    required Meta meta,
}) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) => _$ApiResponseFromJson(json, fromJsonT);
}