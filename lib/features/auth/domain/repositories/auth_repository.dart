part of '_repositories.dart';

abstract class AuthRepository {
  /// Logs in and persists the session token. Throws [Failure] on bad
  /// credentials or network errors.
  Future<void> login({required String email, required String password});

  /// Registers a patient account, then immediately logs in with the same
  /// credentials — the register endpoint itself returns no token, but the
  /// next step (connecting to a physiotherapist) requires an authenticated
  /// session.
  Future<void> registerPatient({
    required String name,
    required String email,
    required String password,
  });

  Future<void> logout();

  /// The authenticated patient's profile — use `isConnectedToPhysiotherapist`
  /// on the result to decide whether to route to the connection-code screen.
  Future<Patient> getCurrentPatient();

  Future<Patient> connectToPhysiotherapist(String connectionCode);
}
