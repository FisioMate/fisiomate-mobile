import 'package:fisiomate/core/errors/failure.dart';
import 'package:fisiomate/features/auth/domain/repositories/_repositories.dart';
import 'package:fisiomate/features/auth/presentation/cubit/current_patient_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentPatientCubit extends Cubit<CurrentPatientState> {
  final AuthRepository repository;

  CurrentPatientCubit({required this.repository})
    : super(const CurrentPatientState.initial());

  Future<void> fetch() async {
    emit(const CurrentPatientState.loading());
    try {
      final patient = await repository.getCurrentPatient();
      emit(CurrentPatientState.loaded(patient));
    } on Failure catch (failure) {
      emit(CurrentPatientState.failure(failure.message));
    }
  }
}
