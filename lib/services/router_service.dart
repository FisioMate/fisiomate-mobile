import 'package:fisiomate/core/widgets/home_shell.dart';
import 'package:fisiomate/features/home/presentation/pages/_pages.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    /* ---------------------------- Home Shell Pages ---------------------------- */
    ShellRoute(
      builder: (context, state, child) => HomeShell(child: child),
      routes: [
        GoRoute(path: "/", builder: (context, state) => const HomePage()),
      ],
    ),
  ],
);
