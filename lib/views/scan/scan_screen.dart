import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinner/data/providers/scan_provider.dart';
import 'package:skinner/shared/navigation/navigation_service.dart';
import 'package:skinner/shared/navigation/navigation_service.dart';

import '../../core/utils/image_util.dart';

class ScanScreen extends ConsumerStatefulWidget {
  const ScanScreen({super.key});

  @override
  ConsumerState<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen> {
  XFile? _selectedImage;
  bool _isLoading = false;

  // Future<void> _pickImage() async {
  //   final picker = ImagePicker();
  //   final image = await picker.pickImage(source: ImageSource.camera);
  //
  //   if (image != null) {
  //     setState(() {
  //       _selectedImage = image;
  //     });
  //   }
  // }

  Future<void> _analyzeImage() async {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please capture an image first!')),
      );
      return;
    }

    setState(() => _isLoading = true);

    final result = await ref.read(scanAnalysisProvider(_selectedImage!.path).future);

    setState(() => _isLoading = false);

    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Predicted Disease: ${result.name}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to analyze image')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Your Skin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _selectedImage != null
                ? Image.file(
                    File(_selectedImage!.path),
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : const Text('No image selected'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final image = await ImagePickerClass.pickImageFromGallery();
                if (image != null){
                  setState(() {
                    _selectedImage = XFile(image.path);
                  });
                }
                },
              child: const Text('Upload Image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final image = await ImagePickerClass.pickImageFromCamera();
                if (image != null){
                  setState(() {
                    _selectedImage = XFile(image.path);
                  });
                }
              },
              child: const Text('Capture Image'),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _analyzeImage,
                    child: const Text('Analyze Image'),
                  ),
          ],
        ),
      ),
    );
  }
}
