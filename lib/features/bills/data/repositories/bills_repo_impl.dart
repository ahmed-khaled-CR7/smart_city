import 'package:dartz/dartz.dart';
import '../../domain/entities/bill_entity.dart';
import '../../domain/repositories/bills_repo.dart';
import '../datasources/bill_remote_datasource.dart';
import '../models/bill_model.dart';

class BillsRepoImpl implements BillsRepository {
  final BillRemoteDataSource remote;
  BillsRepoImpl(this.remote);

  @override
  Future<Either<String, List<BillEntity>>> getMyBills(int citizenId) async {
    try {
      final billsJson = await remote.getMyBills(citizenId);
      final bills = billsJson.map((json) => BillModel.fromJson(json as Map<String, dynamic>)).toList();
      return Right(bills);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, BillEntity>> getBillById(int id) async {
    try {
      final json = await remote.getBillById(id);
      final bill = BillModel.fromJson(json as Map<String, dynamic>);
      return Right(bill);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> payBill(int id) async {
    try {
      await remote.payBill(id);
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
