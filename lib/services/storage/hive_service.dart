import 'package:fisiomate/services/storage/secure_key_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Two Hive boxes, split by sensitivity/rate of change:
///
/// - [authBox] — JWT/session data. Encrypted at rest via an AES key kept
///   in the platform keystore ([SecureKeyService]).
/// - [cacheBox] — offline cache for read-mostly backend data (e.g. the
///   exercise catalog), so the app still has something to show without
///   a connection. Not encrypted — nothing sensitive lives here.
abstract final class HiveService {
  static const String _authBoxName = 'auth_box';
  static const String _cacheBoxName = 'cache_box';

  static late Box _authBox;
  static late Box _cacheBox;

  static Future<void> init() async {
    await Hive.initFlutter();

    final encryptionKey = await SecureKeyService.getAuthBoxEncryptionKey();
    _authBox = await Hive.openBox(
      _authBoxName,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
    _cacheBox = await Hive.openBox(_cacheBoxName);
  }

  static Box get authBox => _authBox;
  static Box get cacheBox => _cacheBox;
}
