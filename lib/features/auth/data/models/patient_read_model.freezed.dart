// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_read_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PatientReadModel _$PatientReadModelFromJson(Map<String, dynamic> json) {
  return _PatientReadModel.fromJson(json);
}

/// @nodoc
mixin _$PatientReadModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'physiotherapist_id')
  String? get physiotherapistId => throw _privateConstructorUsedError;
  @JsonKey(name: 'connection_code')
  String? get connectionCode => throw _privateConstructorUsedError;

  /// Serializes this PatientReadModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientReadModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientReadModelCopyWith<PatientReadModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientReadModelCopyWith<$Res> {
  factory $PatientReadModelCopyWith(
    PatientReadModel value,
    $Res Function(PatientReadModel) then,
  ) = _$PatientReadModelCopyWithImpl<$Res, PatientReadModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String email,
    String password,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'physiotherapist_id') String? physiotherapistId,
    @JsonKey(name: 'connection_code') String? connectionCode,
  });
}

/// @nodoc
class _$PatientReadModelCopyWithImpl<$Res, $Val extends PatientReadModel>
    implements $PatientReadModelCopyWith<$Res> {
  _$PatientReadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientReadModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? userId = freezed,
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
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$PatientReadModelImplCopyWith<$Res>
    implements $PatientReadModelCopyWith<$Res> {
  factory _$$PatientReadModelImplCopyWith(
    _$PatientReadModelImpl value,
    $Res Function(_$PatientReadModelImpl) then,
  ) = __$$PatientReadModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String email,
    String password,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'physiotherapist_id') String? physiotherapistId,
    @JsonKey(name: 'connection_code') String? connectionCode,
  });
}

/// @nodoc
class __$$PatientReadModelImplCopyWithImpl<$Res>
    extends _$PatientReadModelCopyWithImpl<$Res, _$PatientReadModelImpl>
    implements _$$PatientReadModelImplCopyWith<$Res> {
  __$$PatientReadModelImplCopyWithImpl(
    _$PatientReadModelImpl _value,
    $Res Function(_$PatientReadModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientReadModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? userId = freezed,
    Object? physiotherapistId = freezed,
    Object? connectionCode = freezed,
  }) {
    return _then(
      _$PatientReadModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$PatientReadModelImpl implements _PatientReadModel {
  const _$PatientReadModelImpl({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    @JsonKey(name: 'user_id') this.userId,
    @JsonKey(name: 'physiotherapist_id') this.physiotherapistId,
    @JsonKey(name: 'connection_code') this.connectionCode,
  });

  factory _$PatientReadModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientReadModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'physiotherapist_id')
  final String? physiotherapistId;
  @override
  @JsonKey(name: 'connection_code')
  final String? connectionCode;

  @override
  String toString() {
    return 'PatientReadModel(id: $id, name: $name, email: $email, password: $password, userId: $userId, physiotherapistId: $physiotherapistId, connectionCode: $connectionCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientReadModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
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
    email,
    password,
    userId,
    physiotherapistId,
    connectionCode,
  );

  /// Create a copy of PatientReadModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientReadModelImplCopyWith<_$PatientReadModelImpl> get copyWith =>
      __$$PatientReadModelImplCopyWithImpl<_$PatientReadModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientReadModelImplToJson(this);
  }
}

abstract class _PatientReadModel implements PatientReadModel {
  const factory _PatientReadModel({
    required final String id,
    required final String name,
    required final String email,
    required final String password,
    @JsonKey(name: 'user_id') final String? userId,
    @JsonKey(name: 'physiotherapist_id') final String? physiotherapistId,
    @JsonKey(name: 'connection_code') final String? connectionCode,
  }) = _$PatientReadModelImpl;

  factory _PatientReadModel.fromJson(Map<String, dynamic> json) =
      _$PatientReadModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'physiotherapist_id')
  String? get physiotherapistId;
  @override
  @JsonKey(name: 'connection_code')
  String? get connectionCode;

  /// Create a copy of PatientReadModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientReadModelImplCopyWith<_$PatientReadModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
