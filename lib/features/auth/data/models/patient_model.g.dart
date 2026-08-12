// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientModelImpl _$$PatientModelImplFromJson(Map<String, dynamic> json) =>
    _$PatientModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      profileImageUrl: json['profile_image_url'] as String?,
      userId: json['user_id'] as String,
      physiotherapistId: json['physiotherapist_id'] as String?,
      connectionCode: json['connection_code'] as String?,
    );

Map<String, dynamic> _$$PatientModelImplToJson(_$PatientModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_image_url': instance.profileImageUrl,
      'user_id': instance.userId,
      'physiotherapist_id': instance.physiotherapistId,
      'connection_code': instance.connectionCode,
    };
