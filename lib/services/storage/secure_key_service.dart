import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

/// Manages the AES key used to encrypt the sensitive Hive box (auth
/// tokens). The key itself lives in the platform keystore/keychain via
/// [FlutterSecureStorage].
abstract final class SecureKeyService {
  static const _storage = FlutterSecureStorage();
  static const _hiveAuthKeyName = 'hive_auth_box_key';

  static Future<Uint8List> getAuthBoxEncryptionKey() async {
    final existing = await _storage.read(key: _hiveAuthKeyName);
    if (existing != null) {
      return base64Url.decode(existing);
    }

    final generatedKey = Hive.generateSecureKey();
    await _storage.write(
      key: _hiveAuthKeyName,
      value: base64UrlEncode(generatedKey),
    );
    return Uint8List.fromList(generatedKey);
  }
}
