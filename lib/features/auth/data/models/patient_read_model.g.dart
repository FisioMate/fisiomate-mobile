// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_read_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientReadModelImpl _$$PatientReadModelImplFromJson(
  Map<String, dynamic> json,
) => _$PatientReadModelImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  userId: json['user_id'] as String?,
  physiotherapistId: json['physiotherapist_id'] as String?,
  connectionCode: json['connection_code'] as String?,
);

Map<String, dynamic> _$$PatientReadModelImplToJson(
  _$PatientReadModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'password': instance.password,
  'user_id': instance.userId,
  'physiotherapist_id': instance.physiotherapistId,
  'connection_code': instance.connectionCode,
};
