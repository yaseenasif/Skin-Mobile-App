import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinner/core/utils/dialog_util.dart';
import 'package:skinner/core/utils/toast_utils.dart';
import 'package:skinner/shared/navigation/app_routes.dart';
import 'package:skinner/shared/navigation/navigation_service.dart';

import '../../core/utils/bottom_modal_util.dart';
import '../../data/services/prediction_service.dart';
import '../../shared/widgets/bottom_modals/image_pick_modal.dart';
import 'prediction_result_screen.dart';

class ScanScreen extends ConsumerStatefulWidget {
  const ScanScreen({super.key});

  @override
  ConsumerState<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen> {
  XFile? _selectedImage;

  void _showCaptureImageModal() {
    BottomModalUtil.showBottomModal(
      context,
      CaptureImageBottomModal(
        onImageSelected: (File? image) {
          if (image != null) {
            setState(() {
              _selectedImage = XFile(image.path);
            });
          } else {
            ToastUtil.showError(
                "Some error occurred while selecting the image.");
          }
        },
      ),
    );
  }

  Future<void> _analyzeImage() async {
    if (_selectedImage == null) {
      ToastUtil.showToast("Please capture or upload an image first!");
      return;
    }

    DialogUtil.showLoadingDialog();

    try {
      final predictionResult = await ref
          .read(predictionServiceProvider)
          .analyzeImage(_selectedImage!.path);

      DialogUtil.hideLoadingDialog();

      AppNavigator.pushNamed(
        AppRoutes.result,
        arguments: predictionResult,
      );
    } catch (e) {
      DialogUtil.hideLoadingDialog();
      ToastUtil.showError("An error occurred while analyzing the image.");
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
          children: [
            GestureDetector(
              onTap: _showCaptureImageModal,
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: _selectedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(_selectedImage!.path),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt,
                              size: 50, color: Colors.grey[600]),
                          const SizedBox(height: 8),
                          Text(
                            "Tap to select an image",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(), // Push the Analyze button to the bottom
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _analyzeImage,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Analyze Image',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
