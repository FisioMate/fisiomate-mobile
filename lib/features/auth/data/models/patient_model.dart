import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_model.freezed.dart';
part 'patient_model.g.dart';

/// Mirrors the `Patient` schema — `GET /api/v1/patients/me`.
@freezed
class PatientModel with _$PatientModel {
  const factory PatientModel({
    required String id,
    required String name,
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'physiotherapist_id') String? physiotherapistId,
    @JsonKey(name: 'connection_code') String? connectionCode,
  }) = _PatientModel;

  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);
}
