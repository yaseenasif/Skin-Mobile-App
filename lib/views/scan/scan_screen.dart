import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinner/data/providers/scan_provider.dart';
import 'package:skinner/shared/navigation/navigation_service.dart';
import 'package:skinner/shared/navigation/navigation_service.dart';

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

    final result = ref.read(scanAnalysisProvider(_selectedImage!.path));

    setState(() => _isLoading = false);

    AppNavigator.pushNamed(
      '/results',
      arguments: {'scanResult': result},
    );
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
              onPressed: ,
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
