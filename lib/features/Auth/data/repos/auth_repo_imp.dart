import 'package:dartz/dartz.dart';
import 'package:smart_city/core/database/api/api_consumer.dart';
import 'package:smart_city/core/database/api/end_points.dart';
import 'package:smart_city/core/errors/expentions.dart';
import 'package:smart_city/core/helper/secure_storage_helper.dart';
import 'package:smart_city/features/Auth/data/models/sign_in_model.dart';
import 'package:smart_city/features/Auth/data/models/sign_up_model.dart';
import 'package:smart_city/features/Auth/data/models/user_model.dart';
import 'package:smart_city/core/entities/user_entity.dart';
import 'package:smart_city/features/Auth/domain/repos/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiConsumer api;

  AuthRepositoryImpl({required this.api});

  @override
  Future<Either<String, UserEntity>> signIn({
    required String nationalId,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoints.login,
        data: {"nationalId": nationalId, "password": password},
        requireAuth: false,
      );

      final status = (response['status'] as String?)?.toLowerCase();
      if (status == 'error' || status == 'fail') {
        final message = response['message']?.toString() ?? 'Login failed';
        return Left(message);
      }

      final token = response['token'] as String?;
      final userJson = response['user'] as Map<String, dynamic>?;

      if (token == null || token.isEmpty || userJson == null) {
        return const Left('Invalid login response');
      }

      final signInData = SignInModel(
        token: token,
        user: UserModel.fromJson(userJson),
      );

      await SecureStorageHelper.saveToken(signInData.token);

      return Right(signInData.user.toEntity());
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left('Connection failed. Check internet.');
    }
  }

  @override
  Future<Either<String, UserEntity>> signUp({
    required String name,
    required String nationalId,
    required String email,
    required String phone,
    required String password,
    required String address,
  }) async {
    try {
      final response = await api.post(
        EndPoints.register,
        data: {
          "name": name,
          "nationalId": nationalId,
          "email": email,
          "phone": phone,
          "password": password,
          "address": address,
        },
        requireAuth: false,
      );

      final status = (response['status'] as String?)?.toLowerCase();
      if (status == 'error' || status == 'fail') {
        final message = response['message']?.toString() ?? 'Signup failed';
        return Left(message);
      }

      final token = response['token'] as String?;
      final userJson = response['user'] as Map<String, dynamic>?;

      if (token == null || token.isEmpty || userJson == null) {
        return const Left('Invalid signup response');
      }

      final signUpData = SignUpModel(
        token: token,
        user: UserModel.fromJson(userJson),
      );

      await SecureStorageHelper.saveToken(signUpData.token);

      return Right(signUpData.user.toEntity());
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left('Connection failed. Check internet.');
    }
  }
}
