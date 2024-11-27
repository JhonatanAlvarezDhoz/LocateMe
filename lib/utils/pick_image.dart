import 'package:image_picker/image_picker.dart';

class PickImage {
  static Future<XFile?> pickImageFromGallery() async {
    ImagePicker? imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    imagePicker = null;
    return image;
  }

  static Future<List<XFile>> pickMultiImageFromGallery() async {
    ImagePicker? imagePicker = ImagePicker();
    List<XFile>? image = await imagePicker.pickMultiImage(
      imageQuality: 50,
    );
    imagePicker = null;
    return image;
  }

  static Future<XFile?> pickImageFromCamera() async {
    ImagePicker? imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    imagePicker = null;
    return image;
  }
}
