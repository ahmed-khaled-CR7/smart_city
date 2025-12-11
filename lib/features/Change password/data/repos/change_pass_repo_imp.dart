import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_city/core/database/api/api_consumer.dart';
import 'package:smart_city/core/database/api/end_points.dart';
import 'package:smart_city/core/errors/expentions.dart';
import 'package:smart_city/core/errors/failure.dart';
import 'package:smart_city/features/Change%20password/domain/entities/change_pass_entity.dart';
import 'package:smart_city/features/Change%20password/domain/repos/change_pass_repo.dart';

class ChangePasswordRepoImpl implements ChangePasswordRepo {
  final ApiConsumer api;

  ChangePasswordRepoImpl({required this.api});

  @override
  Future<Either<Failure, Unit>> changePassword(
    ChangePasswordEntity entity,
  ) async {
    try {
      await api.put(
        EndPoints.changePassword,
        data: entity.toJson(),
        requireAuth: true,
      );
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.errorMessage));
    } on DioException {
      return Left(ServerFailure('Failed to connect. Please try again.'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }
}
