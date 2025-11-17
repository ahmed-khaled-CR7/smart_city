import '../../domain/entities/complaint_entity.dart';

class ComplaintModel extends ComplaintEntity {
  const ComplaintModel({
    required super.id,
    required super.title,
    required super.description,
    required super.dateSubmitted,
    required super.status,
    required super.location,
    super.imageUrl,
    required super.citizenId,
  });

  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      dateSubmitted: DateTime.parse(json['dateSubmitted'] as String),
      status: json['status'].toString(),
      location: json['location'] as String,
      imageUrl: json['imageUrl'] as String?,
      citizenId: json['citizenId'] as int,
    );
  }
}