import 'package:smart_city/core/database/api/end_ponits.dart';

abstract class ApiConsumer {
  final String baseUrl = EndPoints.baseUrl;

  /// GET Request
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool requireAuth = false,
  });

  /// POST Request
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool isFormData = false,
    bool requireAuth = false,
  });

  /// PUT Request
  Future<dynamic> put(
    String path, {

    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool isFormData = false,
    bool requireAuth = false,
  });

  /// DELETE Request
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool requireAuth = false,
  });
}
