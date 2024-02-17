import 'package:freezed_annotation/freezed_annotation.dart';

import 'group.dart';
import 'level.dart';
part 'class_data.freezed.dart';
part 'class_data.g.dart';


@freezed
class ClassData with _$ClassData {
  const factory ClassData({
    String? id,
    String? status,
    String? createdBy,
    String? updatedBy,
    String? createdAt,
    String? updatedAt,
    String? classTitleEnglish,
    String? classTitleBangla,
    Level? level,
    List<Group>? groups,
  }) = _ClassData;

  factory ClassData.fromJson(Map<String, Object?> json) => _$ClassDataFromJson(json);
}