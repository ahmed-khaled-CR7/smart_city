// lib/core/helper/secure_storage_helper.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static const _storage = FlutterSecureStorage();
  static const String _keyToken = 'user_token';
  static const String _keyIsLoggedIn = 'is_logged_in';

  static Future<void> saveToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
    await _storage.write(key: _keyIsLoggedIn, value: 'true');
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  static Future<bool> isLoggedIn() async {
    final flag = await _storage.read(key: _keyIsLoggedIn);
    return flag == 'true';
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: _keyToken);
    await _storage.delete(key: _keyIsLoggedIn);
  }

  static Future<void> logout() async {
    await deleteToken();
  }
}
