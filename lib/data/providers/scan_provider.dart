import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/scan_service.dart';
import '../models/scan_result_model.dart';

final scanServiceProvider = Provider<ScanService>((ref) => ScanService());

final scanResultsProvider = FutureProvider<List<ScanResultModel>>((ref) async {
  return await ref.watch(scanServiceProvider).fetchScanResults();
});

final scanAnalysisProvider =
    FutureProvider.family<ScanResultModel, String>((ref, imagePath) async {
  return await ref.watch(scanServiceProvider).analyzeScan(imagePath);
});
