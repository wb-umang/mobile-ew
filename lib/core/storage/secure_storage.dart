import 'package:hive_flutter/hive_flutter.dart';

class SecureStorage {
  static const String _boxName = 'secureStorageBox';
  static Box? _box;

  /// Initialize Hive Storage
  static Future<void> init() async {
    await Hive.initFlutter();

    if (!Hive.isBoxOpen(_boxName)) {
      _box = await Hive.openBox(_boxName);
    }
  }

  /// Ensure the box is open before accessing it
  static Future<void> _ensureBoxIsOpen() async {
    if (_box == null || !Hive.isBoxOpen(_boxName)) {
      _box = await Hive.openBox(_boxName);
    }
  }

  /// Save Data
  static Future<void> saveData(String key, String value) async {
    await _ensureBoxIsOpen();
    await _box?.put(key, value);
  }

  /// Get Data
  static Future<String?> getData(String key) async {
    await _ensureBoxIsOpen();
    return _box?.get(key);
  }

  /// Remove Data (Logout)
  static Future<void> removeData() async {
    await _ensureBoxIsOpen();
    await _box?.clear();
  }

  /// Check If User Is Logged In (Token Expiry Check)
  static Future<bool> isLoggedIn() async {
    String? expiryString = await getData("token_expiry");

    if (expiryString == null) return false;

    if (!isValidInteger(expiryString)) return false;

    final expiryTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(expiryString) * 1000);
    final currentTime = DateTime.now();

    return currentTime.isBefore(expiryTime); // True if token is still valid
  }

  /// Close the Hive Box (Optional)
  static Future<void> closeBox() async {
    if (_box != null && _box!.isOpen) {
      await _box?.close();
      _box = null;
    }
  }

  static bool isValidInteger(String input) {
    return int.tryParse(input) != null;
  }
}
