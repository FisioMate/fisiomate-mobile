import 'package:fisiomate/features/exercise/data/models/exercise_catalog_model.dart';
import 'package:fisiomate/features/exercise/data/models/exercise_log_model.dart';
import 'package:fisiomate/features/exercise/domain/entities/day_of_week.dart';
import 'package:fisiomate/features/exercise/domain/entities/routine_item.dart';

/// Mirrors the backend's `ExerciseWithLogsRead` — a patient's prescribed
/// HEP item plus its completion history. `reps`/`durationSeconds` are
/// two separate nullable fields on the wire (only one is set, matching
/// `catalogItem.trackingType`); the domain [RoutineItem] keeps the app's
/// existing single `targetRepsOrSeconds` field, so that split is
/// absorbed here.
class RoutineItemModel {
  final String id;
  final String catalogId;
  final int sets;
  final int? reps;
  final int? durationSeconds;
  final List<String> days;
  final ExerciseCatalogModel? catalogItem;
  final List<ExerciseLogModel> logs;

  const RoutineItemModel({
    required this.id,
    required this.catalogId,
    required this.sets,
    this.reps,
    this.durationSeconds,
    required this.days,
    this.catalogItem,
    this.logs = const [],
  });

  factory RoutineItemModel.fromJson(Map<String, dynamic> json) {
    final rawCatalogItem = json['catalog_item'] as Map<String, dynamic>?;
    final rawLogs = json['logs'] as List<dynamic>? ?? [];

    return RoutineItemModel(
      id: json['id'] as String,
      catalogId: json['catalog_id'] as String,
      sets: json['sets'] as int,
      reps: json['reps'] as int?,
      durationSeconds: json['duration_seconds'] as int?,
      days: (json['days'] as List<dynamic>).cast<String>(),
      catalogItem: rawCatalogItem == null
          ? null
          : ExerciseCatalogModel.fromJson(rawCatalogItem),
      logs: rawLogs
          .map((log) => ExerciseLogModel.fromJson(log as Map<String, dynamic>))
          .toList(),
    );
  }

  /// `null` if the backend didn't embed a catalog item for this
  /// prescription — can't build a [RoutineItem] without knowing which
  /// exercise (and rules) it refers to.
  RoutineItem? toEntity() {
    final catalog = catalogItem;
    if (catalog == null) return null;

    return RoutineItem(
      id: id,
      exercise: catalog.toEntity(),
      sets: sets,
      targetRepsOrSeconds: reps ?? durationSeconds ?? 0,
      days: days.map(DayOfWeek.fromApiValue).toList(),
      logs: logs.map((log) => log.toEntity(id)).toList(),
    );
  }
}
