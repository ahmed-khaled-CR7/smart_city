import 'package:dartz/dartz.dart';
import '../repositories/complaint_repo.dart';
import '../../data/dtos/complaint_create_dto.dart';

class CreateComplaintUseCase {
  final ComplaintRepository repository;

  CreateComplaintUseCase(this.repository);

  Future<Either<String, void>> call({
    required int citizenId,
    required ComplaintCreateDto complaint,
  }) async {
    return await repository.createComplaint(citizenId, complaint);
  }
}