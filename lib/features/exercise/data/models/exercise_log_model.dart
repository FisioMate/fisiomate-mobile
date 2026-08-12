import 'package:fisiomate/features/exercise/domain/entities/exercise_log.dart';

/// Mirrors the backend's `ExerciseLogRead`, embedded under its parent
/// exercise (`exercises[].logs` on `GET /patients/me`).
class ExerciseLogModel {
  final String id;
  final int activeDurationSeconds;
  final int? completedReps;
  final int? completedSets;
  final double accuracyScore;
  final DateTime completedAt;

  const ExerciseLogModel({
    required this.id,
    required this.activeDurationSeconds,
    this.completedReps,
    this.completedSets,
    required this.accuracyScore,
    required this.completedAt,
  });

  factory ExerciseLogModel.fromJson(Map<String, dynamic> json) {
    return ExerciseLogModel(
      id: json['id'] as String,
      activeDurationSeconds: json['active_duration_seconds'] as int,
      completedReps: json['completed_reps'] as int?,
      completedSets: json['completed_sets'] as int?,
      accuracyScore: (json['accuracy_score'] as num).toDouble(),
      // .toLocal() matters here — this gets bucketed by calendar date
      // (session_log_builder.dart) to build the Progress/calendar UI, so
      // an unconverted UTC timestamp can land on the wrong local day
      // (e.g. a late-night completion in WIB reads as "yesterday" UTC).
      completedAt: DateTime.parse(json['completed_at'] as String).toLocal(),
    );
  }

  /// The wire `exercise_id` is nullable and, being nested under a
  /// specific routine item's `logs`, redundant — [parentExerciseId] (the
  /// owning [RoutineItem.id]) is used instead of trusting that field.
  ExerciseLog toEntity(String parentExerciseId) {
    return ExerciseLog(
      id: id,
      exerciseId: parentExerciseId,
      activeDurationSeconds: activeDurationSeconds,
      completedReps: completedReps,
      completedSets: completedSets,
      accuracyScore: accuracyScore,
      completedAt: completedAt,
    );
  }
}
