import 'package:dartz/dartz.dart';
import '../entities/complaint_entity.dart';
import '../../data/dtos/complaint_create_dto.dart'; // نستخدم الـ DTO هنا لتحديد طبيعة الـ Request

abstract class ComplaintRepository {
  Future<Either<String, void>> createComplaint(int citizenId, ComplaintCreateDto complaint);
  Future<Either<String, List<ComplaintEntity>>> getMyComplaints(int citizenId);
}