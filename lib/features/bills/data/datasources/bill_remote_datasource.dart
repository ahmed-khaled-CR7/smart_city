import 'package:dio/dio.dart';
import 'package:smart_city/features/bills/data/models/bill_model.dart';


abstract class BillRemoteDataSource {
  Future<List<BillModel>> getMyBills(int citizenId);
  Future<BillModel> getBillById(int id);
  Future<void> payBill(int id);
}

class BillRemoteDataSourceImpl implements BillRemoteDataSource {
  final Dio dio;
  BillRemoteDataSourceImpl(this.dio);

  @override
  Future<List<BillModel>> getMyBills(int citizenId) async {
    final response = await dio.get(
      '/api/bills/my-bills/$citizenId',
      options: Options(extra: {'requireAuth': true}),
    );
    return (response.data as List)
        .map((e) => BillModel.fromJson(e))
        .toList();
  }

  @override
  Future<BillModel> getBillById(int id) async {
    final response = await dio.get(
      '/api/bills/$id',
      options: Options(extra: {'requireAuth': true}),
    );
    return BillModel.fromJson(response.data);
  }

  @override
  Future<void> payBill(int id) async {
    await dio.put(
      '/api/bills/$id/pay',
      options: Options(extra: {'requireAuth': true}),
    );
  }
}