import 'package:fisiomate/core/widgets/_widgets.dart';
import 'package:fisiomate/features/auth/domain/repositories/_repositories.dart';
import 'package:fisiomate/features/auth/presentation/cubit/_cubits.dart';
import 'package:fisiomate/features/auth/presentation/pages/_pages.dart';
import 'package:fisiomate/features/chat/presentation/pages/_pages.dart';
import 'package:fisiomate/features/home/presentation/pages/_pages.dart';
import 'package:fisiomate/features/profile/presentation/pages/_pages.dart';
import 'package:fisiomate/features/progress/presentation/pages/_pages.dart';
import 'package:fisiomate/services/jwt_service.dart';
import 'package:fisiomate/services/storage/token_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// `/auth` is the only public route — everything else (including
/// `/connect`, since connecting requires a session) needs a valid token.
/// Not checking connection-to-physiotherapist status here on purpose:
/// that's a one-time onboarding step already handled by the explicit
/// navigation in AuthCubit/ConnectionCodeCubit right after login/register.
String? _authGuard(BuildContext context, GoRouterState state) {
  final token = TokenStorage.accessToken;
  final isAuthenticated = token != null && !JwtService.isExpired(token);
  final isPublicRoute = state.matchedLocation == '/auth';

  if (!isAuthenticated && !isPublicRoute) return '/auth';
  if (isAuthenticated && isPublicRoute) return '/';
  return null;
}

final router = GoRouter(
  initialLocation: '/',
  redirect: _authGuard,
  routes: [
    /* ------------------------------- Auth Pages -------------------------------- */
    GoRoute(path: "/auth", builder: (context, state) => const AuthPage()),
    GoRoute(
      path: "/connect",
      builder: (context, state) => const ConnectionCodePage(),
    ),

    /* ---------------------------- Home Shell Pages ---------------------------- */
    ShellRoute(
      builder: (context, state, child) => BlocProvider(
        create: (context) =>
            CurrentPatientCubit(repository: context.read<AuthRepository>())
              ..fetch(),
        child: HomeShell(child: child),
      ),
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
