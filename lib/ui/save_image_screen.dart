import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_labeling_app/services/image_saver_service.dart';

class SaveImageScreen extends StatelessWidget {
  final Uint8List imageBytes;

  SaveImageScreen(this.imageBytes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Save Image')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await ImageSaverService.saveImageToGallery(imageBytes);
          },
          child: Text('Save to Gallery'),
        ),
      ),
    );
  }
}
