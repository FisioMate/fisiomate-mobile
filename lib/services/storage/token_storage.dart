import 'package:fisiomate/services/storage/hive_service.dart';

/// The single source of truth for where the session access token lives
/// in [HiveService.authBox]. Lives at the services tier (not inside
/// `features/auth/`) because [Client]'s auth interceptor needs it too,
/// and `core/` isn't allowed to depend on `features/`.
abstract final class TokenStorage {
  static const String _accessTokenKey = 'access_token';

  static Future<void> saveAccessToken(String token) =>
      HiveService.authBox.put(_accessTokenKey, token);

  static String? get accessToken =>
      HiveService.authBox.get(_accessTokenKey) as String?;

  static Future<void> clearAccessToken() =>
      HiveService.authBox.delete(_accessTokenKey);
}
