part of '_repositories.dart';

abstract class ExerciseRepository {
  /// The authenticated patient's Home Exercise Program — each item's
  /// `days` says which days of the week it's scheduled for; figuring out
  /// "today's" items from that is left to the caller.
  Future<List<RoutineItem>> getRoutineItems();

  /// Logs one completed exercise — the backend tracks logs per exercise
  /// (`GET /patients/me`'s `exercises[].logs`), so this is called once
  /// per [RoutineItem] in the session, not once for the whole routine.
  /// [exerciseId] is the [RoutineItem.id] (the HEP prescription's id),
  /// not the catalog item's id.
  Future<void> completeExerciseSession({
    required String exerciseId,
    required Duration activeDuration,
    required double accuracyScore,
  });
}
