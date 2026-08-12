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

  @override
  Future<List<RoutineItemModel>> getRoutineItems() async {
    final response = await client.get(EndPoints.patientMe);
    final data = response.data as Map<String, dynamic>;
    final exercises = data['exercises'] as List<dynamic>? ?? [];
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
