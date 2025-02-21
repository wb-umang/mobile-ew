import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await _storage.write(key: "access_token", value: token);
  }

  static Future<void> saveTokenExpiry(String tokenExpiry) async {
    await _storage.write(key: "token_expiry", value: tokenExpiry);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: "access_token");
  }

  static Future<String?> getTokenExpiry() async {
    return await _storage.read(key: "token_expiry");
  }

  static Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: "refresh_token", value: token);
  }

  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: "refresh_token");
  }

  // Remove token (for logout)
  static Future<void> removeData() async {
    await _storage.delete(key: "access_token");
    await _storage.delete(key: "refresh_token");
    await _storage.delete(key: "token_expiry");
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    String? expiryString = await getTokenExpiry();

    if (expiryString == null) return false;

    final expiryTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(expiryString) * 1000);
    final currentTime = DateTime.now();

    if (currentTime.isBefore(expiryTime)) {
      return true; // Token is still valid
    } else {
      return false; // Token is expired
    }
  }
}
