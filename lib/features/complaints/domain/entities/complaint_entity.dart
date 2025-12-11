import 'package:equatable/equatable.dart';

class ComplaintEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final DateTime dateSubmitted;
  final int status;
  final String location;
  final String? imageUrl;
  final int citizenId;

  const ComplaintEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.dateSubmitted,
    required this.status,  
    required this.location,
    this.imageUrl,
    required this.citizenId,
  });

  @override
  List<Object?> get props => [id, title, status, citizenId];
}
