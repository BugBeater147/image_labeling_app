import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

class ImageLabelingService {
  static Future<List<Map<String, dynamic>>> labelImage(String imagePath) async {
    final List<Map<String, dynamic>> labels = [];

    try {
      final inputImage = InputImage.fromFilePath(imagePath);

      final imageLabeler = ImageLabeler(
        options: ImageLabelerOptions(confidenceThreshold: 0.5),
      );

      final List<ImageLabel> imageLabels =
          await imageLabeler.processImage(inputImage);

      for (var label in imageLabels) {
        labels.add({
          'label': label.label,
          'confidence': label.confidence,
        });
      }

      imageLabeler.close();
    } catch (e) {
      print("Error during image labeling: $e");
    }

    return labels;
  }
}
