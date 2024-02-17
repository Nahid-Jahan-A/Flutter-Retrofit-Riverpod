import 'package:freezed_annotation/freezed_annotation.dart';
part 'meta.freezed.dart';
part 'meta.g.dart';

@freezed
class Meta with _$Meta {
  const factory Meta({
    int? statusCode,
    String? message,
  }) = _Meta;

  factory Meta.fromJson(Map<String, Object?> json) => _$MetaFromJson(json);
}