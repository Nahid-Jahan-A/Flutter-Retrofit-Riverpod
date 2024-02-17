import 'package:flutter_retrofit/models/version.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'level.freezed.dart';

part 'level.g.dart';

@freezed
class Level with _$Level {
  const factory Level({
    String? id,
    String? status,
    String? createdBy,
    String? updatedBy,
    String? createdAt,
    String? updatedAt,
    String? name,
    Version? version,
  }) = _Level;

  factory Level.fromJson(Map<String, Object?> json) => _$LevelFromJson(json);
}
