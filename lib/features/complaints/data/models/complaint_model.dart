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
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),

      title: json['title']?.toString() ?? "",

      description: json['description']?.toString() ?? "",

      dateSubmitted: DateTime.tryParse(json['dateSubmitted'].toString()) 
          ?? DateTime.now(),

      status: json['status'] is int
          ? json['status']
          : int.tryParse(json['status'].toString()) ?? -1,

      location: json['location']?.toString() ?? "",

      imageUrl: json['imageUrl']?.toString(),

      citizenId: json['citizenId'] is int
          ? json['citizenId']
          : int.parse(json['citizenId'].toString()),
    );
  }

  ComplaintEntity toEntity() => ComplaintEntity(
        id: id,
        title: title,
        description: description,
        dateSubmitted: dateSubmitted,
        status: status,
        location: location,
        imageUrl: imageUrl,
        citizenId: citizenId,
      );
}
