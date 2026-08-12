import 'dart:convert';

/// Local JWT inspection
/// Only useful for cheap, offline checks (e.g. "is this token expired?").
abstract final class JwtService {
  static Map<String, dynamic> decode(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw const FormatException('Invalid JWT format');
    }

    final payload = utf8.decode(
      base64Url.decode(base64Url.normalize(parts[1])),
    );
    return jsonDecode(payload) as Map<String, dynamic>;
  }

  static DateTime? getExpiryDate(String token) {
    final exp = decode(token)['exp'];
    if (exp == null) return null;
    return DateTime.fromMillisecondsSinceEpoch((exp as num).toInt() * 1000);
  }

  static bool isExpired(String token) {
    final expiryDate = getExpiryDate(token);
    if (expiryDate == null) return true;
    return DateTime.now().isAfter(expiryDate);
  }
}
