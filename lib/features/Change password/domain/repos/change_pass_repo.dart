import 'package:dartz/dartz.dart';
import 'package:smart_city/core/errors/failure.dart';
import 'package:smart_city/features/Change%20password/domain/entities/change_pass_entity.dart';

abstract class ChangePasswordRepo {
  Future<Either<Failure, Unit>> changePassword(ChangePasswordEntity entity);
}
