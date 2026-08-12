import 'package:fisiomate/core/client/client.dart';
import 'package:fisiomate/core/themes/app_theme.dart';
import 'package:fisiomate/features/auth/data/datasources/_datasources.dart';
import 'package:fisiomate/features/auth/data/repositories/_repositories.dart';
import 'package:fisiomate/features/auth/domain/repositories/_repositories.dart';
import 'package:fisiomate/features/exercise/data/datasources/_datasources.dart';
import 'package:fisiomate/features/exercise/data/repositories/_repositories.dart';
import 'package:fisiomate/features/exercise/domain/repositories/_repositories.dart';
import 'package:fisiomate/services/router_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (_) => AuthRepositoryImpl(
            remoteDatasource: AuthRemoteDatasourceImpl(client: Client()),
            localDatasource: AuthLocalDatasourceImpl(),
          ),
        ),
        RepositoryProvider<ExerciseRepository>(
          create: (_) => ExerciseRepositoryImpl(
            remoteDatasource: ExerciseRemoteDatasourceImpl(client: Client()),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: AppTheme.light,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
