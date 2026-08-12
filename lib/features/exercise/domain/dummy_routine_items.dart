import 'package:fisiomate/features/exercise/domain/dummy_exercise_catalog.dart';
import 'package:fisiomate/features/exercise/domain/entities/day_of_week.dart';
import 'package:fisiomate/features/exercise/domain/entities/routine_item.dart';

// TODO: replace with real data once ExerciseRepository/GET /exercises is
// wired up. Represents a patient's full weekly HEP (Home Exercise
// Program) — screens filter this down to "today's" items by [DayOfWeek]
// instead of us hardcoding a separate "today" list, since that's what
// the real backend data will look like too.
final List<RoutineItem> dummyRoutineItems = [
  RoutineItem(
    id: 'routine-1',
    exercise: dummyExerciseCatalog.firstWhere(
      (exercise) => exercise.id == 'arm-raise',
    ),
    sets: 3,
    targetRepsOrSeconds: 10,
    days: [DayOfWeek.senin, DayOfWeek.rabu, DayOfWeek.jumat],
  ),
  RoutineItem(
    id: 'routine-2',
    exercise: dummyExerciseCatalog.firstWhere(
      (exercise) => exercise.id == 'squat',
    ),
    sets: 3,
    targetRepsOrSeconds: 8,
    days: [DayOfWeek.senin, DayOfWeek.rabu, DayOfWeek.jumat],
  ),
  RoutineItem(
    id: 'routine-3',
    exercise: dummyExerciseCatalog.firstWhere(
      (exercise) => exercise.id == 'standing-leg-swing',
    ),
    sets: 2,
    targetRepsOrSeconds: 12,
    days: [DayOfWeek.senin, DayOfWeek.rabu, DayOfWeek.jumat],
  ),
  RoutineItem(
    id: 'routine-4',
    exercise: dummyExerciseCatalog.firstWhere(
      (exercise) => exercise.id == 'push-up',
    ),
    sets: 3,
    targetRepsOrSeconds: 10,
    days: [DayOfWeek.selasa, DayOfWeek.kamis, DayOfWeek.sabtu],
  ),
  RoutineItem(
    id: 'routine-5',
    exercise: dummyExerciseCatalog.firstWhere(
      (exercise) => exercise.id == 'plank',
    ),
    sets: 3,
    targetRepsOrSeconds: 30,
    days: [DayOfWeek.selasa, DayOfWeek.kamis, DayOfWeek.sabtu],
  ),
];
