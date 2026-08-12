part of '_datasources.dart';

abstract class AuthRemoteDatasource {
  Future<BearerResponseModel> login({
    required String email,
    required String password,
  });

  Future<void> registerPatient({
    required String name,
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<PatientModel> getCurrentPatient();

  Future<void> connectToPhysiotherapist(String connectionCode);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Client client;

  AuthRemoteDatasourceImpl({required this.client});

  @override
  Future<BearerResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await client.post(
      EndPoints.login,
      data: {'grant_type': 'password', 'username': email, 'password': password},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    return BearerResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> registerPatient({
    required String name,
    required String email,
    required String password,
  }) {
    return client.post(
      EndPoints.registerPatient,
      data: {'name': name, 'email': email, 'password': password},
    );
  }

  @override
  Future<void> logout() {
    return client.post(EndPoints.logout);
  }

  // Simple cache fallback — if the network call fails (offline, backend
  // down), fall back to the last successful response instead of leaving
  // the screen blank. No expiry/invalidation: always prefer network,
  // cache is a last resort.
  @override
  Future<PatientModel> getCurrentPatient() async {
    try {
      final response = await client.get(EndPoints.patientMe);
      final data = response.data as Map<String, dynamic>;
      await HiveService.cacheBox.put(EndPoints.patientMe, jsonEncode(data));
      return PatientModel.fromJson(data);
    } on Failure {
      final cached = HiveService.cacheBox.get(EndPoints.patientMe) as String?;
      if (cached == null) rethrow;
      return PatientModel.fromJson(jsonDecode(cached) as Map<String, dynamic>);
    }
  }

  @override
  Future<void> connectToPhysiotherapist(String connectionCode) {
    return client.post(
      EndPoints.patientConnect,
      data: {'connection_code': connectionCode},
    );
  }
}
