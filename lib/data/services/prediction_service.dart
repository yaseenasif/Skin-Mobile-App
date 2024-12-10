import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinner/core/utils/toast_utils.dart';

import '../models/skin_disease.dart';
import 'api/api_service.dart';

final predictionServiceProvider = Provider<PredictionService>((ref) {
  return PredictionService();
});

class PredictionService {
  Future<SkinDisease> analyzeImage(String imagePath) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imagePath),
      });

      final response = await ApiService().post('/predict', data: formData);

      // Assuming response.data contains the disease information
      return SkinDisease.fromJson(response.data);
    } catch (e) {
      ToastUtil.showError('Error: $e');
      rethrow;
    }
  }
}
