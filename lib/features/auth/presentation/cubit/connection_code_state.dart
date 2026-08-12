import 'package:fisiomate/features/auth/domain/entities/patient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_code_state.freezed.dart';

@freezed
sealed class ConnectionCodeState with _$ConnectionCodeState {
  const factory ConnectionCodeState.initial() = ConnectionCodeInitial;
  const factory ConnectionCodeState.loading() = ConnectionCodeLoading;
  const factory ConnectionCodeState.success(Patient patient) =
      ConnectionCodeSuccess;
  const factory ConnectionCodeState.failure(String message) =
      ConnectionCodeFailureState;
}
