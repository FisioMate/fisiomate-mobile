import 'package:fisiomate/core/widgets/_widgets.dart';
import 'package:fisiomate/features/chat/presentation/pages/_pages.dart';
import 'package:fisiomate/features/home/presentation/pages/_pages.dart';
import 'package:fisiomate/features/profile/presentation/pages/_pages.dart';
import 'package:fisiomate/features/progress/presentation/pages/_pages.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    /* ---------------------------- Home Shell Pages ---------------------------- */
    ShellRoute(
      builder: (context, state, child) => HomeShell(child: child),
      routes: [
        GoRoute(path: "/", builder: (context, state) => const HomePage()),
        GoRoute(
          path: "/progress",
          builder: (context, state) => const ProgressSummaryPage(),
        ),
        GoRoute(path: "/chat", builder: (context, state) => const ChatPage()),
        GoRoute(
          path: "/profile",
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    ),
  ],
);
