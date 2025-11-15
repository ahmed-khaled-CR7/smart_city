// lib/features/Auth/domain/repos/auth_repo.dart

import 'package:dartz/dartz.dart';
import 'package:smart_city/core/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<String, UserEntity>> signUp({
    required String name,
    required String nationalId,
    required String email,
    required String phone,
    required String password,
    required String address,
  });

  Future<Either<String, UserEntity>> signIn({
    required String nationalId,
    required String password,
  });
}
