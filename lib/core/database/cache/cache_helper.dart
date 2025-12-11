// lib/core/database/cache/cache_helper.dart

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_city/core/utils/app_strings.dart';

class CacheHelper {
  // Singleton
  static final CacheHelper _instance = CacheHelper._internal();
  factory CacheHelper(SharedPreferences sharedPreferences) => _instance;
  CacheHelper._internal();

  static late SharedPreferences _prefs;

  // Initialize (must be called in main())
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ──────────────────────────────
  // Generic Save / Get
  // ──────────────────────────────
  static Future<bool> saveData<T>({
    required String key,
    required T value,
  }) async {
    if (value is String) return await _prefs.setString(key, value);
    if (value is int) return await _prefs.setInt(key, value);
    if (value is double) return await _prefs.setDouble(key, value);
    if (value is bool) return await _prefs.setBool(key, value);
    if (value is List<String>) return await _prefs.setStringList(key, value);

    throw UnsupportedError('Type ${T.toString()} is not supported');
  }

  static T? getData<T>({
    required String key,
    T? defaultValue,
  }) {
    final value = _prefs.get(key);
    if (value is T) return value;
    return defaultValue;
  }

  // ──────────────────────────────
  // Remove / Clear / Contains
  // ──────────────────────────────
  static Future<bool> removeData({required String key}) async {
    return await _prefs.remove(key);
  }

  static Future<bool> clear() async {
    return await _prefs.clear();
  }

  static bool containsKey({required String key}) {
    return _prefs.containsKey(key);
  }

  // ──────────────────────────────
  // Token Management (JWT)
  // ──────────────────────────────
  static Future<void> saveToken(String token) async {
    await saveData(key: AppStrings.token, value: token);
  }

  static String? getToken() {
    return getData<String>(key: AppStrings.token);
  }

  static Future<void> removeToken() async {
    await removeData(key: AppStrings.token);
  }

  static bool get isLoggedIn => getToken() != null;

  // ──────────────────────────────
  // Convenience Methods
  // ──────────────────────────────
  static String? getString(String key) => _prefs.getString(key);
  static int? getInt(String key) => _prefs.getInt(key);
  static double? getDouble(String key) => _prefs.getDouble(key);
  static bool? getBool(String key) => _prefs.getBool(key);
}