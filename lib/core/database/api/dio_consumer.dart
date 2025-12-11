import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smart_city/core/database/api/api_consumer.dart';
import 'package:smart_city/core/database/api/end_points.dart';
import 'package:smart_city/core/errors/error_model.dart';
import 'package:smart_city/core/errors/expentions.dart';
import 'package:smart_city/core/helper/secure_storage_helper.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options
      ..baseUrl = EndPoints.baseUrl
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final requireAuth = options.extra['requireAuth'] as bool? ?? false;

          if (requireAuth) {
            final token = await SecureStorageHelper.getToken();
            if (token != null && token.trim().isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
              debugPrint('Token Sent: Bearer ${token.substring(0, 10)}...');
            }
          }

          handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  Map<String, dynamic> _normalize(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is List) return {"data": data};
    if (data is String && data.isNotEmpty) return jsonDecode(data);
    return {};
  }

  Never _handleDioException(DioException e) {
    final map = _normalize(e.response?.data);
    throw ServerException(
      ErrorModel(
        errorMessage: map['message'] ?? e.message ?? 'Unknown error',
        statusCode: e.response?.statusCode,
        errors: map['errors'],
      ),
    );
  }

  // ---------------- GET ----------------
  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool? requireAuth,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          extra: {'requireAuth': requireAuth ?? false},
          headers: headers,
        ),
      );

      return _normalize(response.data);
    } on DioException catch (e) {
      _handleDioException(e);
    }
  }

  // ---------------- POST ----------------
  @override
  Future<Map<String, dynamic>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool isFormData = false,
    bool? requireAuth,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(
          extra: {'requireAuth': requireAuth ?? false},
          headers: headers,
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      return _normalize(response.data);
    } on DioException catch (e) {
      return _normalize(e.response?.data);
    }
  }

  // ---------------- PUT ----------------
  @override
  Future<Map<String, dynamic>> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool isFormData = false,
    bool? requireAuth,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(
          extra: {'requireAuth': requireAuth ?? false},
          headers: headers,
        ),
      );

      return _normalize(response.data);
    } on DioException catch (e) {
      _handleDioException(e);
    }
  }

  // ---------------- DELETE ----------------
  @override
  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool? requireAuth,
  }) async {
    try {
      final response = await dio.delete(
        path,
        queryParameters: queryParameters,
        options: Options(
          extra: {'requireAuth': requireAuth ?? false},
          headers: headers,
        ),
      );

      return _normalize(response.data);
    } on DioException catch (e) {
      _handleDioException(e);
    }
  }
}
