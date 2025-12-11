import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smart_city/core/database/api/api_consumer.dart';
import 'package:smart_city/core/database/api/end_points.dart';
import 'package:smart_city/core/database/cache/cache_helper.dart';
import 'package:smart_city/core/entities/user_entity.dart';
import 'package:smart_city/core/errors/expentions.dart';
import 'package:smart_city/core/errors/failure.dart';
import 'package:smart_city/features/Auth/data/models/user_model.dart';
import 'package:smart_city/features/profile/domain/entites/update_user_dto.dart';
import 'package:smart_city/features/profile/domain/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiConsumer api;

  ProfileRepoImpl({required this.api});

  Map<String, dynamic> _toMap(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is String && data.isNotEmpty) return jsonDecode(data);
    return {};
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final response = await api.get(EndPoints.me, requireAuth: true);
      debugPrint('Raw Response from server: $response');

      final map = _toMap(response);
      final userJson = map["data"] ?? map;
      debugPrint("Parsed User JSON: $userJson");

      if (userJson.isEmpty) {
        return Left(ServerFailure("Empty user data received from server"));
      }

      final user = UserModel.fromJson(userJson).toEntity();
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.errorMessage));
    } on DioException catch (e) {
      return Left(ServerFailure("Network error: ${e.message}"));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: $e"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUser(UpdateUserDto dto) async {
    try {
      final response = await api.put(
        EndPoints.me,
        data: dto.toJson(),
        requireAuth: true,
      );

      final map = _toMap(response);
      final userJson = map["data"];
      if (userJson == null || userJson.isEmpty) {
        return Left(ServerFailure("Invalid response format in updateUser"));
      }
      print("🔵 PROFILE API CALL");
      print("URL = ${EndPoints.me}"); // أو Route اللي عندك
      print("Token = ${CacheHelper.getData(key: 'token')}");

      final user = UserModel.fromJson(userJson).toEntity();
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.errorMessage));
    } on DioException catch (e) {
      return Left(ServerFailure("Network error: ${e.message}"));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: $e"));
    }
  }
}
