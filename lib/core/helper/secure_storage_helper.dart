import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static final _storage = const FlutterSecureStorage();
  static const _tokenKey = 'auth_token';

  static Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
    debugPrint("Token saved: ${token.substring(0, 10)}...");
  }

  static Future<String?> getToken() async {
    final token = await _storage.read(key: _tokenKey);
    if (token != null) {
      debugPrint("Token loaded: ${token.substring(0, 10)}...");
    } else {
      debugPrint("No token in storage");
    }
    return token;
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
    debugPrint("Token deleted");
  }
}
