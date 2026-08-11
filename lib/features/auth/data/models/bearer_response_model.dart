import 'package:freezed_annotation/freezed_annotation.dart';

part 'bearer_response_model.freezed.dart';
part 'bearer_response_model.g.dart';

/// Mirrors the `BearerResponse` schema — the login response, nothing
/// more than the access token itself.
@freezed
class BearerResponseModel with _$BearerResponseModel {
  const factory BearerResponseModel({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'token_type') required String tokenType,
  }) = _BearerResponseModel;

  factory BearerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BearerResponseModelFromJson(json);
}
