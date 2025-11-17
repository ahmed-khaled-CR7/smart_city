import 'package:dio/dio.dart';
import '../dtos/complaint_create_dto.dart';

abstract class ComplaintRemoteDataSource {
  Future<List<dynamic>> getMyComplaints(int citizenId);
  Future<void> createComplaint(int citizenId, ComplaintCreateDto complaint);
}

class ComplaintRemoteDataSourceImpl implements ComplaintRemoteDataSource {
  final Dio dio;

  ComplaintRemoteDataSourceImpl(this.dio);

  @override
  Future<List<dynamic>> getMyComplaints(int citizenId) async {
    final response = await dio.get("/api/complaints/my/$citizenId"); 

    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception("Failed to load complaints: ${response.statusCode}");
    }
  }

  @override
  Future<void> createComplaint(int citizenId, ComplaintCreateDto complaint) async {
    final response = await dio.post(
      "/api/complaints",
      queryParameters: {'citizenId': citizenId}, 
      data: complaint.toJson(),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to create complaint: ${response.statusCode}");
    }
  }
}