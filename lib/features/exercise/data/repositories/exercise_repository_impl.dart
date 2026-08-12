part of '_repositories.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseRemoteDatasource remoteDatasource;

  ExerciseRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<RoutineItem>> getRoutineItems() async {
    final models = await remoteDatasource.getRoutineItems();
    final items = <RoutineItem>[];

    for (final model in models) {
      final entity = model.toEntity();
      if (entity == null) {
        LoggerService.w(
          'Skipping routine item ${model.id} — backend sent no catalog_item',
        );
        continue;
      }
      items.add(entity);
    }

    return items;
  }

  @override
  Future<void> completeExerciseSession({
    required String exerciseId,
    required Duration activeDuration,
    required double accuracyScore,
  }) {
    return remoteDatasource.completeExerciseSession(
      exerciseId: exerciseId,
      activeDurationSeconds: activeDuration.inSeconds,
      accuracyScore: accuracyScore,
    );
  }
}
