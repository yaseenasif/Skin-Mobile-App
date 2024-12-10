import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ImagePickerClass {
  static final ImagePicker _picker = ImagePicker();

  /// Picks an image from the gallery.
  static Future<File?> pickImageFromGallery() async {
    try {
      // Request permission to access gallery
      // final permissionStatus = await Permission.photos.request();
      // if (!permissionStatus.isGranted) {
      //   throw Exception('Gallery permission not granted');
      // }

      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        throw Exception('No image selected');
      }
    } catch (e) {
      // _handleError(e);
      return null;
    }
  }

  /// Captures an image using the camera.
  static Future<File?> pickImageFromCamera() async {
    try {
      // Request permission to access camera
      // final cameraPermissionStatus = await Permission.camera.request();
      // if (!cameraPermissionStatus.isGranted) {
      //   throw Exception('Camera permission not granted');
      // }

      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        throw Exception('No image captured');
      }
    } catch (e) {
      // _handleError(e);
      return null;
    }
  }

  /// A helper method to handle errors
  // static void _handleError(dynamic error) {
  //   String errorMessage;
  //   if (error is PermissionDeniedException) {
  //     errorMessage = "Permission denied.";
  //   } else if (error is PlatformException) {
  //     errorMessage = "Platform error: ${error.message}";
  //   } else if (error is Exception) {
  //     errorMessage = error.toString();
  //   } else {
  //     errorMessage = "An unknown error occurred.";
  //   }
  //   debugPrint('Error: $errorMessage');
  // }
}
