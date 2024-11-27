import 'dart:io';
import 'package:image_picker/image_picker.dart';

/// The ImageUtils class provides utility functions related to image processing.
class ImageUtils {
  /// The createImageUrl function constructs a custom URL for an image.
  /// It takes an optional String parameter `urls` which is the path of the image.

  static File convertXFileToFile(XFile xFile) {
    // Usa el path del XFile para crear una instancia de File
    File file = File(xFile.path);
    return file;
  }

  static Future<XFile> convertToXFile(String imagePath) async {
    try {
      // Crea el objeto XFile directamente desde la ruta temporal
      return XFile(imagePath);
    } catch (e) {
      throw Exception('Error al convertir la imagen: $e');
    }
  }
}
