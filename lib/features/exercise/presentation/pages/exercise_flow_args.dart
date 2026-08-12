part of '_pages.dart';

/// Bundles the state threaded through the guide-screen <-> camera-view
/// navigation loop for one exercise session — which routine item/set
/// we're on, plus the shared [ExerciseSessionProgress] accumulator (see
/// that class for why this isn't a Cubit).
class ExerciseFlowArgs {
  final List<RoutineItem> routineItems;
  final int itemIndex;
  final int currentSet;
  final ExerciseSessionProgress session;

  const ExerciseFlowArgs({
    required this.routineItems,
    required this.itemIndex,
    required this.currentSet,
    required this.session,
  });

  RoutineItem get item => routineItems[itemIndex];
}
