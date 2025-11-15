import 'package:dartz/dartz.dart';
import 'package:smart_city/core/entities/user_entity.dart';
import 'package:smart_city/core/errors/failure.dart';
import 'package:smart_city/features/profile/domain/entites/update_user_dto.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserEntity>> getCurrentUser();
  Future<Either<Failure, UserEntity>> updateUser(UpdateUserDto dto);
}
