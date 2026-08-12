// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bearer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BearerResponseModelImpl _$$BearerResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$BearerResponseModelImpl(
  accessToken: json['access_token'] as String,
  tokenType: json['token_type'] as String,
);

Map<String, dynamic> _$$BearerResponseModelImplToJson(
  _$BearerResponseModelImpl instance,
) => <String, dynamic>{
  'access_token': instance.accessToken,
  'token_type': instance.tokenType,
};
