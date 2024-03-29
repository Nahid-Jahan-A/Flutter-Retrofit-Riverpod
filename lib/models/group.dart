import 'package:freezed_annotation/freezed_annotation.dart';
part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class Group with _$Group {
  const factory Group({
    String? id,
    String? status,
    dynamic createdBy,
    dynamic updatedBy,
    String? createdAt,
    String? updatedAt,
    String? name,
  }) = _Group;

  factory Group.fromJson(Map<String, Object?> json) => _$GroupFromJson(json);
}

