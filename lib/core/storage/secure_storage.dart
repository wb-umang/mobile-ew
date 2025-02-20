import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await _storage.write(key: "auth_token", value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: "auth_token");
  }

  // Remove token (for logout)
  static Future<void> removeToken() async {
    await _storage.delete(key: "access_token");
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    String? token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
