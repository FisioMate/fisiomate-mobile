import 'package:fisiomate/features/exercise/domain/dummy_exercise_catalog.dart';
import 'package:fisiomate/features/exercise/domain/entities/day_of_week.dart';
import 'package:fisiomate/features/exercise/domain/entities/routine_item.dart';

// ! Dummy data used only in demo version
final List<RoutineItem> dummyRoutineItems = [
  RoutineItem(
    id: 'routine-1',
    exercise: dummyExerciseCatalog.firstWhere(
      (exercise) => exercise.id == 'arm-raise',
    ),
    sets: 1,
    targetRepsOrSeconds: 10,
    days: [DayOfWeek.senin, DayOfWeek.rabu, DayOfWeek.jumat],
  ),
  RoutineItem(
    id: 'routine-2',
    exercise: dummyExerciseCatalog.firstWhere(
      (exercise) => exercise.id == 'squat',
    ),
    sets: 1,
    targetRepsOrSeconds: 4,
    days: [DayOfWeek.senin, DayOfWeek.rabu, DayOfWeek.jumat],
  ),
  RoutineItem(
    id: 'routine-3',
    exercise: dummyExerciseCatalog.firstWhere(
      (exercise) => exercise.id == 'standing-leg-swing',
    ),
    sets: 1,
    targetRepsOrSeconds: 8,
    days: [DayOfWeek.senin, DayOfWeek.rabu, DayOfWeek.jumat],
  ),
];
