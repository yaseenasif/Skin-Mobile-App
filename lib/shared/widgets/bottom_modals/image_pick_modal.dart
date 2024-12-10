import 'package:flutter/material.dart';
import 'dart:io';

import '../../../core/utils/image_util.dart';

class CaptureImageBottomModal extends StatelessWidget {
  final ValueChanged<File?> onImageSelected;

  const CaptureImageBottomModal({
    super.key,
    required this.onImageSelected,
  });

  Future<void> _handlePickImage(
      BuildContext context, bool isFromGallery) async {
    File? image;
    if (isFromGallery) {
      image = await ImagePickerClass.pickImageFromGallery();
    } else {
      image = await ImagePickerClass.pickImageFromCamera();
    }
    Navigator.pop(context); // Close the modal after the action
    onImageSelected(image); // Pass the selected image back
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Choose an Option',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.camera_alt, color: Colors.blue),
            title: const Text('Capture Image'),
            onTap: () => _handlePickImage(context, false),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.photo_library, color: Colors.green),
            title: const Text('Pick from Gallery'),
            onTap: () => _handlePickImage(context, true),
          ),
        ],
      ),
    );
  }
}
