import 'package:dartz/dartz.dart';
import 'package:smart_city/features/bills/domain/entities/bill_entity.dart';

abstract class BillsRepository {
  Future<Either<String, List<BillEntity>>> getMyBills(int citizenId);
  Future<Either<String, BillEntity>> getBillById(int id);
  Future<Either<String, void>> payBill(int id);
}