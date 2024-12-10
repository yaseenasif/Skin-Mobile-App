import 'dart:io';

import 'package:dio/dio.dart';
import 'package:skinner/data/services/api/api_service.dart';

import '../models/scan_result_model.dart';

class ScanService {
  // final List<ScanResultModel> _mockResults = [
  //   ScanResultModel(
  //     id: '1',
  //     date: '2024-11-21',
  //     riskLevel: 'Low',
  //     confidence: '92%',
  //   ),
  //   ScanResultModel(
  //     id: '2',
  //     date: '2024-11-20',
  //     riskLevel: 'Moderate',
  //     confidence: '85%',
  //   ),
  // ];
  //
  // Future<List<ScanResultModel>> fetchScanResults() async {
  //   await Future.delayed(const Duration(seconds: 2)); // Mock delay
  //   return _mockResults;
  // }

  Future<ScanResultModel> analyzeScan(String imagePath) async {
    try {
      final File imageFile = File(imagePath);
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path),
      });

      final response = await ApiService().post('/predict', data: formData);

      if (response.statusCode == 201) {
        final data = response.data;
        // Assuming your API response includes a 'disease' field with the prediction
        return ScanResultModel(
          id: data['id'],
          name: data['name'],
          description: data['description'],
          treatment: data['treatment']
        );
      } else {
        throw Exception('Failed to analyze image');
      }
    } catch (e) {
      throw Exception('Failed to analyze image: $e');
    }
  }
}
