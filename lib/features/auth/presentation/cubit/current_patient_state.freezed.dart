// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_patient_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CurrentPatientState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Patient patient) loaded,
    required TResult Function(String message) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Patient patient)? loaded,
    TResult? Function(String message)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Patient patient)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentPatientInitial value) initial,
    required TResult Function(CurrentPatientLoading value) loading,
    required TResult Function(CurrentPatientLoaded value) loaded,
    required TResult Function(CurrentPatientFailureState value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentPatientInitial value)? initial,
    TResult? Function(CurrentPatientLoading value)? loading,
    TResult? Function(CurrentPatientLoaded value)? loaded,
    TResult? Function(CurrentPatientFailureState value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentPatientInitial value)? initial,
    TResult Function(CurrentPatientLoading value)? loading,
    TResult Function(CurrentPatientLoaded value)? loaded,
    TResult Function(CurrentPatientFailureState value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentPatientStateCopyWith<$Res> {
  factory $CurrentPatientStateCopyWith(
    CurrentPatientState value,
    $Res Function(CurrentPatientState) then,
  ) = _$CurrentPatientStateCopyWithImpl<$Res, CurrentPatientState>;
}

/// @nodoc
class _$CurrentPatientStateCopyWithImpl<$Res, $Val extends CurrentPatientState>
    implements $CurrentPatientStateCopyWith<$Res> {
  _$CurrentPatientStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrentPatientState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CurrentPatientInitialImplCopyWith<$Res> {
  factory _$$CurrentPatientInitialImplCopyWith(
    _$CurrentPatientInitialImpl value,
    $Res Function(_$CurrentPatientInitialImpl) then,
  ) = __$$CurrentPatientInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CurrentPatientInitialImplCopyWithImpl<$Res>
    extends _$CurrentPatientStateCopyWithImpl<$Res, _$CurrentPatientInitialImpl>
    implements _$$CurrentPatientInitialImplCopyWith<$Res> {
  __$$CurrentPatientInitialImplCopyWithImpl(
    _$CurrentPatientInitialImpl _value,
    $Res Function(_$CurrentPatientInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CurrentPatientState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CurrentPatientInitialImpl implements CurrentPatientInitial {
  const _$CurrentPatientInitialImpl();

  @override
  String toString() {
    return 'CurrentPatientState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentPatientInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Patient patient) loaded,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Patient patient)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Patient patient)? loaded,
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
    required TResult Function(CurrentPatientInitial value) initial,
    required TResult Function(CurrentPatientLoading value) loading,
    required TResult Function(CurrentPatientLoaded value) loaded,
    required TResult Function(CurrentPatientFailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentPatientInitial value)? initial,
    TResult? Function(CurrentPatientLoading value)? loading,
    TResult? Function(CurrentPatientLoaded value)? loaded,
    TResult? Function(CurrentPatientFailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentPatientInitial value)? initial,
    TResult Function(CurrentPatientLoading value)? loading,
    TResult Function(CurrentPatientLoaded value)? loaded,
    TResult Function(CurrentPatientFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CurrentPatientInitial implements CurrentPatientState {
  const factory CurrentPatientInitial() = _$CurrentPatientInitialImpl;
}

/// @nodoc
abstract class _$$CurrentPatientLoadingImplCopyWith<$Res> {
  factory _$$CurrentPatientLoadingImplCopyWith(
    _$CurrentPatientLoadingImpl value,
    $Res Function(_$CurrentPatientLoadingImpl) then,
  ) = __$$CurrentPatientLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CurrentPatientLoadingImplCopyWithImpl<$Res>
    extends _$CurrentPatientStateCopyWithImpl<$Res, _$CurrentPatientLoadingImpl>
    implements _$$CurrentPatientLoadingImplCopyWith<$Res> {
  __$$CurrentPatientLoadingImplCopyWithImpl(
    _$CurrentPatientLoadingImpl _value,
    $Res Function(_$CurrentPatientLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CurrentPatientState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CurrentPatientLoadingImpl implements CurrentPatientLoading {
  const _$CurrentPatientLoadingImpl();

  @override
  String toString() {
    return 'CurrentPatientState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentPatientLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Patient patient) loaded,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Patient patient)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Patient patient)? loaded,
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
    required TResult Function(CurrentPatientInitial value) initial,
    required TResult Function(CurrentPatientLoading value) loading,
    required TResult Function(CurrentPatientLoaded value) loaded,
    required TResult Function(CurrentPatientFailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentPatientInitial value)? initial,
    TResult? Function(CurrentPatientLoading value)? loading,
    TResult? Function(CurrentPatientLoaded value)? loaded,
    TResult? Function(CurrentPatientFailureState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentPatientInitial value)? initial,
    TResult Function(CurrentPatientLoading value)? loading,
    TResult Function(CurrentPatientLoaded value)? loaded,
    TResult Function(CurrentPatientFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CurrentPatientLoading implements CurrentPatientState {
  const factory CurrentPatientLoading() = _$CurrentPatientLoadingImpl;
}

/// @nodoc
abstract class _$$CurrentPatientLoadedImplCopyWith<$Res> {
  factory _$$CurrentPatientLoadedImplCopyWith(
    _$CurrentPatientLoadedImpl value,
    $Res Function(_$CurrentPatientLoadedImpl) then,
  ) = __$$CurrentPatientLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Patient patient});
}

/// @nodoc
class __$$CurrentPatientLoadedImplCopyWithImpl<$Res>
    extends _$CurrentPatientStateCopyWithImpl<$Res, _$CurrentPatientLoadedImpl>
    implements _$$CurrentPatientLoadedImplCopyWith<$Res> {
  __$$CurrentPatientLoadedImplCopyWithImpl(
    _$CurrentPatientLoadedImpl _value,
    $Res Function(_$CurrentPatientLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CurrentPatientState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? patient = null}) {
    return _then(
      _$CurrentPatientLoadedImpl(
        null == patient
            ? _value.patient
            : patient // ignore: cast_nullable_to_non_nullable
                  as Patient,
      ),
    );
  }
}

/// @nodoc

class _$CurrentPatientLoadedImpl implements CurrentPatientLoaded {
  const _$CurrentPatientLoadedImpl(this.patient);

  @override
  final Patient patient;

  @override
  String toString() {
    return 'CurrentPatientState.loaded(patient: $patient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentPatientLoadedImpl &&
            (identical(other.patient, patient) || other.patient == patient));
  }

  @override
  int get hashCode => Object.hash(runtimeType, patient);

  /// Create a copy of CurrentPatientState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentPatientLoadedImplCopyWith<_$CurrentPatientLoadedImpl>
  get copyWith =>
      __$$CurrentPatientLoadedImplCopyWithImpl<_$CurrentPatientLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Patient patient) loaded,
    required TResult Function(String message) failure,
  }) {
    return loaded(patient);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Patient patient)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(patient);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Patient patient)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(patient);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentPatientInitial value) initial,
    required TResult Function(CurrentPatientLoading value) loading,
    required TResult Function(CurrentPatientLoaded value) loaded,
    required TResult Function(CurrentPatientFailureState value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentPatientInitial value)? initial,
    TResult? Function(CurrentPatientLoading value)? loading,
    TResult? Function(CurrentPatientLoaded value)? loaded,
    TResult? Function(CurrentPatientFailureState value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentPatientInitial value)? initial,
    TResult Function(CurrentPatientLoading value)? loading,
    TResult Function(CurrentPatientLoaded value)? loaded,
    TResult Function(CurrentPatientFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class CurrentPatientLoaded implements CurrentPatientState {
  const factory CurrentPatientLoaded(final Patient patient) =
      _$CurrentPatientLoadedImpl;

  Patient get patient;

  /// Create a copy of CurrentPatientState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentPatientLoadedImplCopyWith<_$CurrentPatientLoadedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CurrentPatientFailureStateImplCopyWith<$Res> {
  factory _$$CurrentPatientFailureStateImplCopyWith(
    _$CurrentPatientFailureStateImpl value,
    $Res Function(_$CurrentPatientFailureStateImpl) then,
  ) = __$$CurrentPatientFailureStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CurrentPatientFailureStateImplCopyWithImpl<$Res>
    extends
        _$CurrentPatientStateCopyWithImpl<
          $Res,
          _$CurrentPatientFailureStateImpl
        >
    implements _$$CurrentPatientFailureStateImplCopyWith<$Res> {
  __$$CurrentPatientFailureStateImplCopyWithImpl(
    _$CurrentPatientFailureStateImpl _value,
    $Res Function(_$CurrentPatientFailureStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CurrentPatientState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$CurrentPatientFailureStateImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CurrentPatientFailureStateImpl implements CurrentPatientFailureState {
  const _$CurrentPatientFailureStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CurrentPatientState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentPatientFailureStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of CurrentPatientState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentPatientFailureStateImplCopyWith<_$CurrentPatientFailureStateImpl>
  get copyWith =>
      __$$CurrentPatientFailureStateImplCopyWithImpl<
        _$CurrentPatientFailureStateImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Patient patient) loaded,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Patient patient)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Patient patient)? loaded,
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
    required TResult Function(CurrentPatientInitial value) initial,
    required TResult Function(CurrentPatientLoading value) loading,
    required TResult Function(CurrentPatientLoaded value) loaded,
    required TResult Function(CurrentPatientFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentPatientInitial value)? initial,
    TResult? Function(CurrentPatientLoading value)? loading,
    TResult? Function(CurrentPatientLoaded value)? loaded,
    TResult? Function(CurrentPatientFailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentPatientInitial value)? initial,
    TResult Function(CurrentPatientLoading value)? loading,
    TResult Function(CurrentPatientLoaded value)? loaded,
    TResult Function(CurrentPatientFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class CurrentPatientFailureState implements CurrentPatientState {
  const factory CurrentPatientFailureState(final String message) =
      _$CurrentPatientFailureStateImpl;

  String get message;

  /// Create a copy of CurrentPatientState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentPatientFailureStateImplCopyWith<_$CurrentPatientFailureStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
