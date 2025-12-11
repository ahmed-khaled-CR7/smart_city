import 'package:dartz/dartz.dart';
import '../../domain/repositories/complaint_repo.dart';
import '../../domain/entities/complaint_entity.dart';
import '../datasources/complaint_remote_datasource.dart';
import '../dtos/complaint_create_dto.dart';
import '../models/complaint_model.dart';

class ComplaintRepoImpl implements ComplaintRepository {
  final ComplaintRemoteDataSource remote;

  ComplaintRepoImpl(this.remote);

  @override
  Future<Either<String, void>> createComplaint(
      int citizenId, ComplaintCreateDto complaint) async {
    try {
      await remote.createComplaint(citizenId, complaint);
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ComplaintEntity>>> getMyComplaints(
      int citizenId) async {
    try {
      // ← مفيش parameters للـ data source
      final response = await remote.getMyComplaints(citizenId);

      /// لو السيرفر رجع null → رجع list فاضية
      if (response == null) {
        return const Right([]);
      }

      /// تحويل JSON إلى Model → ثم إلى Entity
      final complaints = response
          .map((json) => ComplaintModel.fromJson(json))
          .cast<ComplaintEntity>()
          .toList();

      return Right(complaints);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
