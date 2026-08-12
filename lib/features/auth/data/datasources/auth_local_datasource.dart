part of '_datasources.dart';

abstract class AuthLocalDatasource {
  Future<void> saveAccessToken(String token);

  String? getAccessToken();

  Future<void> clearAccessToken();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  @override
  Future<void> saveAccessToken(String token) =>
      TokenStorage.saveAccessToken(token);

  @override
  String? getAccessToken() => TokenStorage.accessToken;

  @override
  Future<void> clearAccessToken() => TokenStorage.clearAccessToken();
}
