import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinner/data/services/prediction_service.dart';

import '../models/skin_disease.dart';

final predictionProvider =
    AsyncNotifierProvider<PredictionNotifier, SkinDisease?>(
        PredictionNotifier.new);

class PredictionNotifier extends AsyncNotifier<SkinDisease?> {
  Future<void> analyzeImage(String imagePath) async {
    final service = ref.read(predictionServiceProvider);
    state = const AsyncValue.loading(); // Set loading state

    try {
      final result = await service.analyzeImage(imagePath);
      state = AsyncValue.data(result); // Set success state
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current); // Set error state
    }
  }

  @override
  FutureOr<SkinDisease?> build() {
    return null;
  }
}
