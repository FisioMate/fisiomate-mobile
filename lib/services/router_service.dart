import 'package:fisiomate/core/widgets/_widgets.dart';
import 'package:fisiomate/features/exercise/domain/entities/routine_item.dart';
import 'package:fisiomate/features/exercise/domain/exercise_session_progress.dart';
import 'package:fisiomate/features/exercise/presentation/pages/_pages.dart';
import 'package:fisiomate/features/home/presentation/pages/_pages.dart';
import 'package:fisiomate/features/profile/presentation/pages/_pages.dart';
import 'package:fisiomate/features/progress/presentation/pages/_pages.dart';
import 'package:go_router/go_router.dart';

// Demo version — no backend, no auth. Everything is reachable straight
// from the shell.
final router = GoRouter(
  initialLocation: '/',
  routes: [
    /* ------------------------------ Detail Pages -------------------------------- */
    // Outside the ShellRoute on purpose — drill-down pages like this one
    // don't show the bottom nav bar.
    GoRoute(
      path: "/progress/history",
      builder: (context, state) => const AllSessionHistoryPage(),
    ),
    GoRoute(
      path: "/exercise",
      builder: (context, state) =>
          PreExercisePage(routineItems: state.extra as List<RoutineItem>),
    ),
    GoRoute(
      path: "/exercise/guide",
      builder: (context, state) =>
          ExerciseGuidePage(args: state.extra as ExerciseFlowArgs),
    ),
    GoRoute(
      path: "/exercise/camera",
      builder: (context, state) =>
          CameraViewPage(args: state.extra as ExerciseFlowArgs),
    ),
    GoRoute(
      path: "/exercise/result",
      builder: (context, state) => ExerciseResultPage(
        session: state.extra as ExerciseSessionProgress,
      ),
    ),

    /* ---------------------------- Home Shell Pages ---------------------------- */
    ShellRoute(
      builder: (context, state, child) => HomeShell(child: child),
      routes: [
        GoRoute(path: "/", builder: (context, state) => const HomePage()),
        GoRoute(
          path: "/progress",
          builder: (context, state) => const ProgressSummaryPage(),
        ),
        GoRoute(
          path: "/profile",
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    ),
  ],
);
