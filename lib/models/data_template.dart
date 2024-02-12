import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_template.g.dart';
part 'data_template.freezed.dart';

class ApiResponse<T> {
  bool success;
  Meta meta;
  List<T> data;

  ApiResponse({
    required this.success,
    required this.meta,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ApiResponse<T>(
      success: json['success'],
      meta: Meta.fromJson(json['meta']),
      data: (json['data'] as List).map((itemJson) => fromJsonT(itemJson)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'meta': meta.toJson(),
      // 'data': data.map((item) => item?.toJson()).toList(),
    };
  }
}

class Meta {
  // Define your meta data fields here
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) {
    // Parse and return Meta instance from JSON
    return Meta();
  }

  Map<String, dynamic> toJson() {
    // Convert Meta instance to JSON
    return {};
  }
}

class YourDataModel {
  // Define your data model fields here
  YourDataModel();

  factory YourDataModel.fromJson(Map<String, dynamic> json) {
    // Parse and return YourDataModel instance from JSON
    return YourDataModel();
  }

  Map<String, dynamic> toJson() {
    // Convert YourDataModel instance to JSON
    return {};
  }
}


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

// @freezed
// class Meta with _$Meta {
//   const factory Meta({required int statusCode, String? message}) = _Meta;
//
//   factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
// }
//
// @Freezed(genericArgumentFactories: true)
// sealed class ApiResponse<T> with _$ApiResponse<T> {
//   const factory ApiResponse({
//     required bool success,
//     required T data,
//     required Meta meta,
// }) = _ApiResponse;
//
//   factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) => _$ApiResponseFromJson(json, fromJsonT);
// }