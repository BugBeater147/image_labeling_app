import 'dart:typed_data';
import 'dart:io';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class ImageSaverService {
  /// Saves an image to the gallery.
  static Future<void> saveImageToGallery(Uint8List imageBytes) async {
    try {
      // Get the temporary directory
      final tempDir = await getTemporaryDirectory();
      // Create a temporary file for the image
      final tempPath = '${tempDir.path}/temp_image.jpg';
      final file = await File(tempPath).writeAsBytes(imageBytes);

      // Save the image to the gallery
      final success = await GallerySaver.saveImage(file.path);
      if (success == true) {
        print('Image saved successfully!');
      } else {
        print('Failed to save the image.');
      }
    } catch (e) {
      print('Error saving image: $e');
    }
  }
}
