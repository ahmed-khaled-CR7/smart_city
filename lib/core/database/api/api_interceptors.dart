// lib/core/api/api_interceptor.dart

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_city/core/database/api/end_ponits.dart';
import 'package:smart_city/core/database/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = CacheHelper.getData(key: ApiKey.token);

    if (token != null && token.toString().trim().isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
      debugPrint('Token Sent: Bearer ${token.substring(0, 10)}...');
    } else {
      debugPrint('No token found for request: ${options.path}');
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
      'API Error: ${err.response?.statusCode} - ${err.response?.data}',
    );
    super.onError(err, handler);
  }
}
