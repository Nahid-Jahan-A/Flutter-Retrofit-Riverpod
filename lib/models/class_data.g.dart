// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassDataImpl _$$ClassDataImplFromJson(Map<String, dynamic> json) =>
    _$ClassDataImpl(
      id: json['id'] as String?,
      status: json['status'] as String?,
      createdBy: json['createdBy'] as String?,
      updatedBy: json['updatedBy'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      classTitleEnglish: json['classTitleEnglish'] as String?,
      classTitleBangla: json['classTitleBangla'] as String?,
      level: json['level'] == null
          ? null
          : Level.fromJson(json['level'] as Map<String, dynamic>),
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClassDataImplToJson(_$ClassDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'classTitleEnglish': instance.classTitleEnglish,
      'classTitleBangla': instance.classTitleBangla,
      'level': instance.level,
      'groups': instance.groups,
    };
