import 'package:flutter/material.dart';
import 'dart:io';
import '../services/image_picker_service.dart';
import '../services/image_labeling_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _selectedImage;
  List<Map<String, dynamic>> _labels = [];
  bool _isLoading = false;

  // Method to process the image and label it
  Future<void> _processImage(File image) async {
    setState(() {
      _isLoading = true;
      _selectedImage = image;
      _labels = [];
    });

    try {
      final labels = await ImageLabelingService.labelImage(image.path);
      setState(() {
        _labels = labels;
        _isLoading = false;
      });
    } catch (e) {
      print("Error labeling image: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Method to pick image from the camera
  Future<void> _pickFromCamera() async {
    final imagePath = await ImagePickerService.pickImageFromCamera();
    if (imagePath != null) {
      _processImage(File(imagePath));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No image captured")),
      );
    }
  }

  // Method to pick image from the gallery
  Future<void> _pickFromGallery() async {
    final imagePath = await ImagePickerService.pickImageFromGallery();
    if (imagePath != null) {
      _processImage(File(imagePath));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No image selected")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Labeling App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Buttons for selecting/capturing image
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _pickFromCamera,
                  child: Text('Capture Image'),
                ),
                ElevatedButton(
                  onPressed: _pickFromGallery,
                  child: Text('Select Image'),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Display selected image
            if (_selectedImage != null)
              Expanded(
                flex: 2,
                child: Image.file(_selectedImage!),
              ),
            SizedBox(height: 10),
            // Show loading indicator or detected labels
            if (_isLoading)
              Center(child: CircularProgressIndicator())
            else if (_labels.isNotEmpty)
              Expanded(
                flex: 3,
                child: ListView.builder(
                  itemCount: _labels.length,
                  itemBuilder: (context, index) {
                    final label = _labels[index];
                    return ListTile(
                      title: Text(label['label']),
                      subtitle: Text(
                          'Confidence: ${(label['confidence'] * 100).toStringAsFixed(2)}%'),
                    );
                  },
                ),
              )
            else if (_selectedImage != null)
              Center(child: Text("No labels detected. Try another image.")),
          ],
        ),
      ),
    );
  }
}
