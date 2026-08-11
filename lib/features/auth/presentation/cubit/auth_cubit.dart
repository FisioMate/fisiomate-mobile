import 'package:fisiomate/core/errors/failure.dart';
import 'package:fisiomate/features/auth/domain/repositories/_repositories.dart';
import 'package:fisiomate/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit({required this.repository}) : super(const AuthState.initial());

  Future<void> login({required String email, required String password}) async {
    emit(const AuthState.loading());
    try {
      await repository.login(email: email, password: password);
      final patient = await repository.getCurrentPatient();
      emit(AuthState.loginSuccess(patient));
    } on Failure catch (failure) {
      emit(AuthState.failure(failure.message));
    }
  }

  Future<void> registerPatient({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const AuthState.loading());
    try {
      await repository.registerPatient(
        name: name,
        email: email,
        password: password,
      );
      emit(const AuthState.registerSuccess());
    } on Failure catch (failure) {
      emit(AuthState.failure(failure.message));
    }
  }
}
