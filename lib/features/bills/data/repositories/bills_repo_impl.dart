import 'package:dartz/dartz.dart';
import 'package:smart_city/core/database/api/api_consumer.dart';
import 'package:smart_city/core/database/api/end_ponits.dart';
import 'package:smart_city/core/errors/expentions.dart';
import 'package:smart_city/features/bills/data/models/bill_model.dart';
import 'package:smart_city/features/bills/domain/entities/bill_entity.dart';
import 'package:smart_city/features/bills/domain/repositories/bills_repo.dart';

class BillsRepoImpl implements BillsRepository {
  final ApiConsumer api;

  BillsRepoImpl({required this.api});

  @override
  Future<Either<String, List<BillEntity>>> getMyBills(int citizenId) async {
    try {
      final response = await api.get(
        EndPoints.myBills(citizenId),
        requireAuth: true,
      );

      final List<dynamic> data =
          response['data'] is List
              ? response['data']
              : (response is List ? response : []);

      final bills =
          data
              .map((json) => BillModel.fromJson(json as Map<String, dynamic>))
              .toList();

      return Right(bills);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage ?? "  falied to load bills");
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, BillEntity>> getBillById(int id) async {
    try {
      final response = await api.get(
        EndPoints.billDetail(id),
        requireAuth: true,
      );

      final Map<String, dynamic> json =
          response['data'] is Map<String, dynamic>
              ? response['data']
              : (response);

      final bill = BillModel.fromJson(json);
      return Right(bill);
    } on ServerException catch (e) {
      return Left(
        e.errorModel.errorMessage ?? "falied to load bills detaills ",
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> payBill(int id) async {
    try {
      await api.put(EndPoints.payBill(id), requireAuth: true);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage ?? "failed");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
