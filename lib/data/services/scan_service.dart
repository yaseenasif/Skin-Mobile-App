import '../models/scan_result_model.dart';

class ScanService {
  final List<ScanResultModel> _mockResults = [
    ScanResultModel(
      id: '1',
      date: '2024-11-21',
      riskLevel: 'Low',
      confidence: '92%',
    ),
    ScanResultModel(
      id: '2',
      date: '2024-11-20',
      riskLevel: 'Moderate',
      confidence: '85%',
    ),
  ];

  Future<List<ScanResultModel>> fetchScanResults() async {
    await Future.delayed(const Duration(seconds: 2)); // Mock delay
    return _mockResults;
  }

  Future<ScanResultModel> analyzeScan(String imagePath) async {
    await Future.delayed(const Duration(seconds: 3)); // Mock delay
    // Mock analysis result
    return ScanResultModel(
      id: DateTime.now().toString(),
      date: DateTime.now().toIso8601String(),
      riskLevel: 'Moderate',
      confidence: '87%',
    );
  }
}
