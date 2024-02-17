import 'package:freezed_annotation/freezed_annotation.dart';
part 'version.freezed.dart';
part 'version.g.dart';

@freezed
class Version with _$Version {
  const factory Version({
    String? id,
    String? status,
    String? createdBy,
    String? updatedBy,
    String? createdAt,
    String? updatedAt,
    String? name,
  }) = _Version;

  factory Version.fromJson(Map<String, Object?> json) =>
      _$VersionFromJson(json);
}
