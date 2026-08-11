// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_code_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ConnectionCodeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Patient patient) success,
    required TResult Function(String message) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Patient patient)? success,
    TResult? Function(String message)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Patient patient)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectionCodeInitial value) initial,
    required TResult Function(ConnectionCodeLoading value) loading,
    required TResult Function(ConnectionCodeSuccess value) success,
    required TResult Function(ConnectionCodeFailureState value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectionCodeInitial value)? initial,
    TResult? Function(ConnectionCodeLoading value)? loading,
    TResult? Function(ConnectionCodeSuccess value)? success,
    TResult? Function(ConnectionCodeFailureState value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectionCodeInitial value)? initial,
    TResult Function(ConnectionCodeLoading value)? loading,
    TResult Function(ConnectionCodeSuccess value)? success,
    TResult Function(ConnectionCodeFailureState value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionCodeStateCopyWith<$Res> {
  factory $ConnectionCodeStateCopyWith(
    ConnectionCodeState value,
    $Res Function(ConnectionCodeState) then,
  ) = _$ConnectionCodeStateCopyWithImpl<$Res, ConnectionCodeState>;
}

/// @nodoc
class _$ConnectionCodeStateCopyWithImpl<$Res, $Val extends ConnectionCodeState>
    implements $ConnectionCodeStateCopyWith<$Res> {
  _$ConnectionCodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnectionCodeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConnectionCodeInitialImplCopyWith<$Res> {
  factory _$$ConnectionCodeInitialImplCopyWith(
    _$ConnectionCodeInitialImpl value,
    $Res Function(_$ConnectionCodeInitialImpl) then,
  ) = __$$ConnectionCodeInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectionCodeInitialImplCopyWithImpl<$Res>
    extends _$ConnectionCodeStateCopyWithImpl<$Res, _$ConnectionCodeInitialImpl>
    implements _$$ConnectionCodeInitialImplCopyWith<$Res> {
  __$$ConnectionCodeInitialImplCopyWithImpl(
    _$ConnectionCodeInitialImpl _value,
    $Res Function(_$ConnectionCodeInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConnectionCodeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectionCodeInitialImpl implements ConnectionCodeInitial {
  const _$ConnectionCodeInitialImpl();

  @override
  String toString() {
    return 'ConnectionCodeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionCodeInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Patient patient) success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Patient patient)? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Patient patient)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectionCodeInitial value) initial,
    required TResult Function(ConnectionCodeLoading value) loading,
    required TResult Function(ConnectionCodeSuccess value) success,
    required TResult Function(ConnectionCodeFailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectionCodeInitial value)? initial,
    TResult? Function(ConnectionCodeLoading value)? loading,
    TResult? Function(ConnectionCodeSuccess value)? success,
    TResult? Function(ConnectionCodeFailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectionCodeInitial value)? initial,
    TResult Function(ConnectionCodeLoading value)? loading,
    TResult Function(ConnectionCodeSuccess value)? success,
    TResult Function(ConnectionCodeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ConnectionCodeInitial implements ConnectionCodeState {
  const factory ConnectionCodeInitial() = _$ConnectionCodeInitialImpl;
}

/// @nodoc
abstract class _$$ConnectionCodeLoadingImplCopyWith<$Res> {
  factory _$$ConnectionCodeLoadingImplCopyWith(
    _$ConnectionCodeLoadingImpl value,
    $Res Function(_$ConnectionCodeLoadingImpl) then,
  ) = __$$ConnectionCodeLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectionCodeLoadingImplCopyWithImpl<$Res>
    extends _$ConnectionCodeStateCopyWithImpl<$Res, _$ConnectionCodeLoadingImpl>
    implements _$$ConnectionCodeLoadingImplCopyWith<$Res> {
  __$$ConnectionCodeLoadingImplCopyWithImpl(
    _$ConnectionCodeLoadingImpl _value,
    $Res Function(_$ConnectionCodeLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConnectionCodeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectionCodeLoadingImpl implements ConnectionCodeLoading {
  const _$ConnectionCodeLoadingImpl();

  @override
  String toString() {
    return 'ConnectionCodeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionCodeLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Patient patient) success,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Patient patient)? success,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Patient patient)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectionCodeInitial value) initial,
    required TResult Function(ConnectionCodeLoading value) loading,
    required TResult Function(ConnectionCodeSuccess value) success,
    required TResult Function(ConnectionCodeFailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectionCodeInitial value)? initial,
    TResult? Function(ConnectionCodeLoading value)? loading,
    TResult? Function(ConnectionCodeSuccess value)? success,
    TResult? Function(ConnectionCodeFailureState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectionCodeInitial value)? initial,
    TResult Function(ConnectionCodeLoading value)? loading,
    TResult Function(ConnectionCodeSuccess value)? success,
    TResult Function(ConnectionCodeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ConnectionCodeLoading implements ConnectionCodeState {
  const factory ConnectionCodeLoading() = _$ConnectionCodeLoadingImpl;
}

/// @nodoc
abstract class _$$ConnectionCodeSuccessImplCopyWith<$Res> {
  factory _$$ConnectionCodeSuccessImplCopyWith(
    _$ConnectionCodeSuccessImpl value,
    $Res Function(_$ConnectionCodeSuccessImpl) then,
  ) = __$$ConnectionCodeSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Patient patient});
}

/// @nodoc
class __$$ConnectionCodeSuccessImplCopyWithImpl<$Res>
    extends _$ConnectionCodeStateCopyWithImpl<$Res, _$ConnectionCodeSuccessImpl>
    implements _$$ConnectionCodeSuccessImplCopyWith<$Res> {
  __$$ConnectionCodeSuccessImplCopyWithImpl(
    _$ConnectionCodeSuccessImpl _value,
    $Res Function(_$ConnectionCodeSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConnectionCodeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? patient = null}) {
    return _then(
      _$ConnectionCodeSuccessImpl(
        null == patient
            ? _value.patient
            : patient // ignore: cast_nullable_to_non_nullable
                  as Patient,
      ),
    );
  }
}

/// @nodoc

class _$ConnectionCodeSuccessImpl implements ConnectionCodeSuccess {
  const _$ConnectionCodeSuccessImpl(this.patient);

  @override
  final Patient patient;

  @override
  String toString() {
    return 'ConnectionCodeState.success(patient: $patient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionCodeSuccessImpl &&
            (identical(other.patient, patient) || other.patient == patient));
  }

  @override
  int get hashCode => Object.hash(runtimeType, patient);

  /// Create a copy of ConnectionCodeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionCodeSuccessImplCopyWith<_$ConnectionCodeSuccessImpl>
  get copyWith =>
      __$$ConnectionCodeSuccessImplCopyWithImpl<_$ConnectionCodeSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Patient patient) success,
    required TResult Function(String message) failure,
  }) {
    return success(patient);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Patient patient)? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(patient);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Patient patient)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(patient);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectionCodeInitial value) initial,
    required TResult Function(ConnectionCodeLoading value) loading,
    required TResult Function(ConnectionCodeSuccess value) success,
    required TResult Function(ConnectionCodeFailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectionCodeInitial value)? initial,
    TResult? Function(ConnectionCodeLoading value)? loading,
    TResult? Function(ConnectionCodeSuccess value)? success,
    TResult? Function(ConnectionCodeFailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectionCodeInitial value)? initial,
    TResult Function(ConnectionCodeLoading value)? loading,
    TResult Function(ConnectionCodeSuccess value)? success,
    TResult Function(ConnectionCodeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ConnectionCodeSuccess implements ConnectionCodeState {
  const factory ConnectionCodeSuccess(final Patient patient) =
      _$ConnectionCodeSuccessImpl;

  Patient get patient;

  /// Create a copy of ConnectionCodeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionCodeSuccessImplCopyWith<_$ConnectionCodeSuccessImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectionCodeFailureStateImplCopyWith<$Res> {
  factory _$$ConnectionCodeFailureStateImplCopyWith(
    _$ConnectionCodeFailureStateImpl value,
    $Res Function(_$ConnectionCodeFailureStateImpl) then,
  ) = __$$ConnectionCodeFailureStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ConnectionCodeFailureStateImplCopyWithImpl<$Res>
    extends
        _$ConnectionCodeStateCopyWithImpl<
          $Res,
          _$ConnectionCodeFailureStateImpl
        >
    implements _$$ConnectionCodeFailureStateImplCopyWith<$Res> {
  __$$ConnectionCodeFailureStateImplCopyWithImpl(
    _$ConnectionCodeFailureStateImpl _value,
    $Res Function(_$ConnectionCodeFailureStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConnectionCodeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ConnectionCodeFailureStateImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ConnectionCodeFailureStateImpl implements ConnectionCodeFailureState {
  const _$ConnectionCodeFailureStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ConnectionCodeState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionCodeFailureStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ConnectionCodeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionCodeFailureStateImplCopyWith<_$ConnectionCodeFailureStateImpl>
  get copyWith =>
      __$$ConnectionCodeFailureStateImplCopyWithImpl<
        _$ConnectionCodeFailureStateImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Patient patient) success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Patient patient)? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Patient patient)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectionCodeInitial value) initial,
    required TResult Function(ConnectionCodeLoading value) loading,
    required TResult Function(ConnectionCodeSuccess value) success,
    required TResult Function(ConnectionCodeFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectionCodeInitial value)? initial,
    TResult? Function(ConnectionCodeLoading value)? loading,
    TResult? Function(ConnectionCodeSuccess value)? success,
    TResult? Function(ConnectionCodeFailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectionCodeInitial value)? initial,
    TResult Function(ConnectionCodeLoading value)? loading,
    TResult Function(ConnectionCodeSuccess value)? success,
    TResult Function(ConnectionCodeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class ConnectionCodeFailureState implements ConnectionCodeState {
  const factory ConnectionCodeFailureState(final String message) =
      _$ConnectionCodeFailureStateImpl;

  String get message;

  /// Create a copy of ConnectionCodeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionCodeFailureStateImplCopyWith<_$ConnectionCodeFailureStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
