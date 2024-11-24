import 'package:flutter/material.dart';
import 'dart:io';
import '../services/image_labeling_service.dart';

class ImageDisplayScreen extends StatefulWidget {
  final String imagePath;

  ImageDisplayScreen({required this.imagePath});

  @override
  _ImageDisplayScreenState createState() => _ImageDisplayScreenState();
}

class _ImageDisplayScreenState extends State<ImageDisplayScreen> {
  List<Map<String, dynamic>> labels = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _labelImage();
  }

  Future<void> _labelImage() async {
    try {
      final detectedLabels =
          await ImageLabelingService.labelImage(widget.imagePath);
      setState(() {
        labels = detectedLabels;
        isLoading = false;
      });
    } catch (e) {
      print("Error labeling image: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Preview'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: widget.imagePath.isNotEmpty
                ? Image.file(File(widget.imagePath))
                : Center(child: Text('No image selected.')),
          ),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : labels.isEmpty
                  ? Center(
                      child: Text("No labels detected. Try another image."))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: labels.length,
                        itemBuilder: (context, index) {
                          final label = labels[index];
                          return ListTile(
                            title: Text(label['label']),
                            subtitle: Text(
                                'Confidence: ${(label['confidence'] * 100).toStringAsFixed(2)}%'),
                          );
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}
