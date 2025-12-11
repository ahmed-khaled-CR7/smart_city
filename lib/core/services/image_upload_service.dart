import 'package:dio/dio.dart';

class ImageUploadService {
  static Future<String?> uploadImage(String path) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(path),
        'upload_preset': '<YOUR_PRESET>',
      });

      final res = await Dio().post(
        "https://api.cloudinary.com/v1_1/<YOUR_CLOUD_NAME>/image/upload",
        data: formData,
      );

      return res.data["secure_url"];
    } catch (e) {
      print("Upload error: $e");
      return null;
    }
  }
}