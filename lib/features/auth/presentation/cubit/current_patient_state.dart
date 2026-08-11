import 'package:fisiomate/features/auth/domain/entities/patient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_patient_state.freezed.dart';

@freezed
sealed class CurrentPatientState with _$CurrentPatientState {
  const factory CurrentPatientState.initial() = CurrentPatientInitial;
  const factory CurrentPatientState.loading() = CurrentPatientLoading;
  const factory CurrentPatientState.loaded(Patient patient) =
      CurrentPatientLoaded;
  const factory CurrentPatientState.failure(String message) =
      CurrentPatientFailureState;
}
