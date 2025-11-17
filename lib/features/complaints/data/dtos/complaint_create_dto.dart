class ComplaintCreateDto {
  final String title;
  final String description;
  final String location;
  final String? imageUrl;

  ComplaintCreateDto({
    required this.title,
    required this.description,
    required this.location,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "location": location,
      "imageUrl": imageUrl,
    };
  }
}