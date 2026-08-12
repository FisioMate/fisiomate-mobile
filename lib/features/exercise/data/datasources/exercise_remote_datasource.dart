part of '_datasources.dart';

abstract class ExerciseRemoteDatasource {
  /// `GET /exercises` is not patient-accessible (403) — the patient's HEP
  /// items come embedded in `GET /patients/me`'s `exercises` field
  /// instead, alongside the rest of the patient profile.
  Future<List<RoutineItemModel>> getRoutineItems();

  Future<void> completeExerciseSession({
    required String exerciseId,
    required int activeDurationSeconds,
    required double accuracyScore,
  });
}

class ExerciseRemoteDatasourceImpl implements ExerciseRemoteDatasource {
  final Client client;

  ExerciseRemoteDatasourceImpl({required this.client});

  // Simple cache fallback — if the network call fails (offline, backend
  // down), fall back to the last successful response instead of leaving
  // the screen blank. No expiry/invalidation: always prefer network,
  // cache is a last resort. Shares its cache entry with
  // AuthRemoteDatasource.getCurrentPatient — both hit `GET /patients/me`.
  @override
  Future<List<RoutineItemModel>> getRoutineItems() async {
    try {
      final response = await client.get(EndPoints.patientMe);
      final data = response.data as Map<String, dynamic>;
      await HiveService.cacheBox.put(EndPoints.patientMe, jsonEncode(data));
      return _parseExercises(data);
    } on Failure {
      final cached = HiveService.cacheBox.get(EndPoints.patientMe) as String?;
      if (cached == null) rethrow;
      return _parseExercises(jsonDecode(cached) as Map<String, dynamic>);
    }
  }

  List<RoutineItemModel> _parseExercises(Map<String, dynamic> patientData) {
    final exercises = patientData['exercises'] as List<dynamic>? ?? [];
    return exercises
        .map((item) => RoutineItemModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> completeExerciseSession({
    required String exerciseId,
    required int activeDurationSeconds,
    required double accuracyScore,
  }) {
    return client.post(
      EndPoints.exerciseSessionsComplete,
      data: {
        'exercise_id': exerciseId,
        'active_duration_seconds': activeDurationSeconds,
        'completed_reps': null,
        'completed_sets': null,
        'accuracy_score': accuracyScore,
      },
    );
  }
}
