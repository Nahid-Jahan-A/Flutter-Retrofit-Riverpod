// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Level _$LevelFromJson(Map<String, dynamic> json) {
  return _Level.fromJson(json);
}

/// @nodoc
mixin _$Level {
  String? get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  String? get updatedBy => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  Version? get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LevelCopyWith<Level> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LevelCopyWith<$Res> {
  factory $LevelCopyWith(Level value, $Res Function(Level) then) =
      _$LevelCopyWithImpl<$Res, Level>;
  @useResult
  $Res call(
      {String? id,
      String? status,
      String? createdBy,
      String? updatedBy,
      String? createdAt,
      String? updatedAt,
      String? name,
      Version? version});

  $VersionCopyWith<$Res>? get version;
}

/// @nodoc
class _$LevelCopyWithImpl<$Res, $Val extends Level>
    implements $LevelCopyWith<$Res> {
  _$LevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? name = freezed,
    Object? version = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VersionCopyWith<$Res>? get version {
    if (_value.version == null) {
      return null;
    }

    return $VersionCopyWith<$Res>(_value.version!, (value) {
      return _then(_value.copyWith(version: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LevelImplCopyWith<$Res> implements $LevelCopyWith<$Res> {
  factory _$$LevelImplCopyWith(
          _$LevelImpl value, $Res Function(_$LevelImpl) then) =
      __$$LevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? status,
      String? createdBy,
      String? updatedBy,
      String? createdAt,
      String? updatedAt,
      String? name,
      Version? version});

  @override
  $VersionCopyWith<$Res>? get version;
}

/// @nodoc
class __$$LevelImplCopyWithImpl<$Res>
    extends _$LevelCopyWithImpl<$Res, _$LevelImpl>
    implements _$$LevelImplCopyWith<$Res> {
  __$$LevelImplCopyWithImpl(
      _$LevelImpl _value, $Res Function(_$LevelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? name = freezed,
    Object? version = freezed,
  }) {
    return _then(_$LevelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LevelImpl implements _Level {
  const _$LevelImpl(
      {this.id,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.version});

  factory _$LevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LevelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? status;
  @override
  final String? createdBy;
  @override
  final String? updatedBy;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? name;
  @override
  final Version? version;

  @override
  String toString() {
    return 'Level(id: $id, status: $status, createdBy: $createdBy, updatedBy: $updatedBy, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LevelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, createdBy, updatedBy,
      createdAt, updatedAt, name, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LevelImplCopyWith<_$LevelImpl> get copyWith =>
      __$$LevelImplCopyWithImpl<_$LevelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LevelImplToJson(
      this,
    );
  }
}

abstract class _Level implements Level {
  const factory _Level(
      {final String? id,
      final String? status,
      final String? createdBy,
      final String? updatedBy,
      final String? createdAt,
      final String? updatedAt,
      final String? name,
      final Version? version}) = _$LevelImpl;

  factory _Level.fromJson(Map<String, dynamic> json) = _$LevelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get status;
  @override
  String? get createdBy;
  @override
  String? get updatedBy;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  String? get name;
  @override
  Version? get version;
  @override
  @JsonKey(ignore: true)
  _$$LevelImplCopyWith<_$LevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
