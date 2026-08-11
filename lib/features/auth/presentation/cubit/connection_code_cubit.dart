import 'package:fisiomate/core/errors/failure.dart';
import 'package:fisiomate/features/auth/domain/repositories/_repositories.dart';
import 'package:fisiomate/features/auth/presentation/cubit/connection_code_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectionCodeCubit extends Cubit<ConnectionCodeState> {
  final AuthRepository repository;

  ConnectionCodeCubit({required this.repository})
    : super(const ConnectionCodeState.initial());

  Future<void> connect(String connectionCode) async {
    emit(const ConnectionCodeState.loading());
    try {
      final patient = await repository.connectToPhysiotherapist(
        connectionCode,
      );
      emit(ConnectionCodeState.success(patient));
    } on Failure catch (failure) {
      emit(ConnectionCodeState.failure(failure.message));
    }
  }
}
