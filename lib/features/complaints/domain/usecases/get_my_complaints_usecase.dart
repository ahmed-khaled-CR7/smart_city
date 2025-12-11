import 'package:dartz/dartz.dart';
import '../repositories/complaint_repo.dart';
import '../entities/complaint_entity.dart';

class GetMyComplaintsUseCase {
  final ComplaintRepository repository;

  GetMyComplaintsUseCase(this.repository);

  Future<Either<String, List<ComplaintEntity>>> call({
    required int citizenId,
  }) async {
    return await repository.getMyComplaints(citizenId);
  }
}