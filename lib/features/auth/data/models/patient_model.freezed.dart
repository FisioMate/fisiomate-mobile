// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) {
  return _PatientModel.fromJson(json);
}

/// @nodoc
mixin _$PatientModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image_url')
  String? get profileImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'physiotherapist_id')
  String? get physiotherapistId => throw _privateConstructorUsedError;
  @JsonKey(name: 'connection_code')
  String? get connectionCode => throw _privateConstructorUsedError;

  /// Serializes this PatientModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientModelCopyWith<PatientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientModelCopyWith<$Res> {
  factory $PatientModelCopyWith(
    PatientModel value,
    $Res Function(PatientModel) then,
  ) = _$PatientModelCopyWithImpl<$Res, PatientModel>;
  @useResult
  $Res call({
    String id,
    String name,
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'physiotherapist_id') String? physiotherapistId,
    @JsonKey(name: 'connection_code') String? connectionCode,
  });
}

/// @nodoc
class _$PatientModelCopyWithImpl<$Res, $Val extends PatientModel>
    implements $PatientModelCopyWith<$Res> {
  _$PatientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profileImageUrl = freezed,
    Object? userId = null,
    Object? physiotherapistId = freezed,
    Object? connectionCode = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            profileImageUrl: freezed == profileImageUrl
                ? _value.profileImageUrl
                : profileImageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            physiotherapistId: freezed == physiotherapistId
                ? _value.physiotherapistId
                : physiotherapistId // ignore: cast_nullable_to_non_nullable
                      as String?,
            connectionCode: freezed == connectionCode
                ? _value.connectionCode
                : connectionCode // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PatientModelImplCopyWith<$Res>
    implements $PatientModelCopyWith<$Res> {
  factory _$$PatientModelImplCopyWith(
    _$PatientModelImpl value,
    $Res Function(_$PatientModelImpl) then,
  ) = __$$PatientModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'physiotherapist_id') String? physiotherapistId,
    @JsonKey(name: 'connection_code') String? connectionCode,
  });
}

/// @nodoc
class __$$PatientModelImplCopyWithImpl<$Res>
    extends _$PatientModelCopyWithImpl<$Res, _$PatientModelImpl>
    implements _$$PatientModelImplCopyWith<$Res> {
  __$$PatientModelImplCopyWithImpl(
    _$PatientModelImpl _value,
    $Res Function(_$PatientModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profileImageUrl = freezed,
    Object? userId = null,
    Object? physiotherapistId = freezed,
    Object? connectionCode = freezed,
  }) {
    return _then(
      _$PatientModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        profileImageUrl: freezed == profileImageUrl
            ? _value.profileImageUrl
            : profileImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        physiotherapistId: freezed == physiotherapistId
            ? _value.physiotherapistId
            : physiotherapistId // ignore: cast_nullable_to_non_nullable
                  as String?,
        connectionCode: freezed == connectionCode
            ? _value.connectionCode
            : connectionCode // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientModelImpl implements _PatientModel {
  const _$PatientModelImpl({
    required this.id,
    required this.name,
    @JsonKey(name: 'profile_image_url') this.profileImageUrl,
    @JsonKey(name: 'user_id') required this.userId,
    @JsonKey(name: 'physiotherapist_id') this.physiotherapistId,
    @JsonKey(name: 'connection_code') this.connectionCode,
  });

  factory _$PatientModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'profile_image_url')
  final String? profileImageUrl;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'physiotherapist_id')
  final String? physiotherapistId;
  @override
  @JsonKey(name: 'connection_code')
  final String? connectionCode;

  @override
  String toString() {
    return 'PatientModel(id: $id, name: $name, profileImageUrl: $profileImageUrl, userId: $userId, physiotherapistId: $physiotherapistId, connectionCode: $connectionCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.physiotherapistId, physiotherapistId) ||
                other.physiotherapistId == physiotherapistId) &&
            (identical(other.connectionCode, connectionCode) ||
                other.connectionCode == connectionCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    profileImageUrl,
    userId,
    physiotherapistId,
    connectionCode,
  );

  /// Create a copy of PatientModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientModelImplCopyWith<_$PatientModelImpl> get copyWith =>
      __$$PatientModelImplCopyWithImpl<_$PatientModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientModelImplToJson(this);
  }
}

abstract class _PatientModel implements PatientModel {
  const factory _PatientModel({
    required final String id,
    required final String name,
    @JsonKey(name: 'profile_image_url') final String? profileImageUrl,
    @JsonKey(name: 'user_id') required final String userId,
    @JsonKey(name: 'physiotherapist_id') final String? physiotherapistId,
    @JsonKey(name: 'connection_code') final String? connectionCode,
  }) = _$PatientModelImpl;

  factory _PatientModel.fromJson(Map<String, dynamic> json) =
      _$PatientModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'profile_image_url')
  String? get profileImageUrl;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'physiotherapist_id')
  String? get physiotherapistId;
  @override
  @JsonKey(name: 'connection_code')
  String? get connectionCode;

  /// Create a copy of PatientModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientModelImplCopyWith<_$PatientModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
