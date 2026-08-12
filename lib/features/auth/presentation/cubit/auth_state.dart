import 'package:fisiomate/features/auth/domain/entities/patient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;

  /// Login succeeded — [patient.isConnectedToPhysiotherapist] decides
  /// whether the page routes home or to the connection-code screen.
  const factory AuthState.loginSuccess(Patient patient) = AuthLoginSuccess;

  /// Registration succeeded (and the repository already logged the new
  /// account in) — always routes to the connection-code screen, a brand
  /// new account can't be connected yet.
  const factory AuthState.registerSuccess() = AuthRegisterSuccess;

  const factory AuthState.failure(String message) = AuthFailureState;
}
