part of '_repositories.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  final AuthLocalDatasource localDatasource;

  AuthRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  @override
  Future<void> login({required String email, required String password}) async {
    final bearer = await remoteDatasource.login(
      email: email,
      password: password,
    );
    await localDatasource.saveAccessToken(bearer.accessToken);
  }

  @override
  Future<void> registerPatient({
    required String name,
    required String email,
    required String password,
  }) async {
    await remoteDatasource.registerPatient(
      name: name,
      email: email,
      password: password,
    );
    await login(email: email, password: password);
  }

  @override
  Future<void> logout() async {
    try {
      await remoteDatasource.logout();
    } finally {
      await localDatasource.clearAccessToken();
    }
  }

  @override
  Future<Patient> getCurrentPatient() async {
    final model = await remoteDatasource.getCurrentPatient();
    return Patient(
      id: model.id,
      name: model.name,
      profileImageUrl: model.profileImageUrl,
      userId: model.userId,
      physiotherapistId: model.physiotherapistId,
      connectionCode: model.connectionCode,
    );
  }

  @override
  Future<Patient> connectToPhysiotherapist(String connectionCode) async {
    final model = await remoteDatasource.connectToPhysiotherapist(
      connectionCode,
    );
    return Patient(
      id: model.id,
      name: model.name,
      // PatientReadModel has no profile_image_url in this response shape.
      profileImageUrl: null,
      userId: model.userId ?? '',
      physiotherapistId: model.physiotherapistId,
      connectionCode: model.connectionCode,
    );
  }
}
