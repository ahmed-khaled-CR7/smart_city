import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static Future<XFile?> pickImage() async {
    return await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );
  }
}