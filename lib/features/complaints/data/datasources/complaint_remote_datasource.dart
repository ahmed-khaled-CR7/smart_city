import 'package:smart_city/core/database/api/api_consumer.dart';
import 'package:smart_city/core/database/api/end_points.dart';
import '../dtos/complaint_create_dto.dart';

abstract class ComplaintRemoteDataSource {
  Future<List<dynamic>> getMyComplaints(int citizenId);
  Future<void> createComplaint(int citizenId, ComplaintCreateDto complaint);
}

class ComplaintRemoteDataSourceImpl implements ComplaintRemoteDataSource {
  final ApiConsumer api;

  ComplaintRemoteDataSourceImpl(this.api);

  @override
  Future<List<dynamic>> getMyComplaints(int citizenId) async {
    final response = await api.get(
      EndPoints.myComplaints(citizenId),
      requireAuth: true,
    );

    // ----------------------
    // Case 1: API returns a raw List
    // ----------------------
    final data = response["data"];
    if (data is List) return data;
    return [];

    // ----------------------
    // Case 2: API returns { "data": [...] }
    // ----------------------
    // if (response is Map<String, dynamic>) {
    //   final data = response["data"];
    //   if (data is List) {
    //     return data;
    //   }
    // }

    // fallback (empty list)
    // return [];
  }

  @override
  Future<void> createComplaint(
    int citizenId,
    ComplaintCreateDto complaint,
  ) async {
    await api.post(
      EndPoints.createComplaint(citizenId),
      data: complaint.toJson(),
      requireAuth: true,
    );
  }
}
