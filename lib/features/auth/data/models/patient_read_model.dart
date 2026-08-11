import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_read_model.freezed.dart';
part 'patient_read_model.g.dart';

/// Mirrors the `PatientRead` schema — the response of
/// `POST /api/v1/patients/connect`. Note this shape carries `email` and
/// `password` (the backend echoes them back for some reason); we only
/// ever map the fields the domain [Patient] entity actually needs and
/// drop `password` there — never let a raw password value leave the
/// data layer.
@freezed
class PatientReadModel with _$PatientReadModel {
  const factory PatientReadModel({
    required String id,
    required String name,
    required String email,
    required String password,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'physiotherapist_id') String? physiotherapistId,
    @JsonKey(name: 'connection_code') String? connectionCode,
  }) = _PatientReadModel;

  factory PatientReadModel.fromJson(Map<String, dynamic> json) =>
      _$PatientReadModelFromJson(json);
}
