import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/entities/bill_entity.dart';
import '../../domain/repositories/bills_repo.dart';
import '../models/bill_model.dart';


abstract class BillRemoteDataSource {
  Future<List<dynamic>> getMyBills(int userId);
  Future<Map<String, dynamic>> getBillById(int id);
  Future<void> payBill(int id);
}

class BillRemoteDataSourceImpl implements BillRemoteDataSource {
  final Dio dio;

  BillRemoteDataSourceImpl(this.dio) {
    // dio.options.baseUrl = AppConfig.currentBaseUrl; 
    dio.options.baseUrl = "http://10.0.2.2:8000"; 
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  @override
  Future<List<dynamic>> getMyBills(int userId) async {
    final response = await dio.get("/api/bills/my-bills/$userId");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Failed to load bills");
    }
  }

  @override
  Future<Map<String, dynamic>> getBillById(int id) async {
    final response = await dio.get("/api/bills/$id");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Failed to get bill");
    }
  }

  @override
  Future<void> payBill(int id) async {
    final response = await dio.put("/api/bills/$id/pay");
    if (response.statusCode != 200) {
      throw Exception("Payment failed");
    }
  }
}


class BillsRepoImpl implements BillsRepository {
  final BillRemoteDataSource remote;
  BillsRepoImpl(this.remote);

  @override
  Future<Either<String, List<BillEntity>>> getMyBills(int citizenId) async {
    try {
      final billsJson = await remote.getMyBills(citizenId);
      final bills = billsJson.map((json) => BillModel.fromJson(json)).toList();
      return Right(bills);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, BillEntity>> getBillById(int id) async {
    try {
      final json = await remote.getBillById(id);
      final bill = BillModel.fromJson(json);
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