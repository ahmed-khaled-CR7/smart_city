// lib/core/api/api_interceptor.dart

import 'package:dio/dio.dart';
import 'package:smart_city/core/database/api/end_ponits.dart';
import 'package:smart_city/core/database/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = CacheHelper().getData(key: ApiKey.token);

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}
