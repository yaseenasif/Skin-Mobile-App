import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/recent_scan.dart';

// Mock data for recent scans
final recentScansProvider =
    StateNotifierProvider<RecentScansNotifier, List<RecentScan>>((ref) {
  return RecentScansNotifier();
});

class RecentScansNotifier extends StateNotifier<List<RecentScan>> {
  RecentScansNotifier()
      : super([
          RecentScan(
              date: '2024-11-21',
              result: 'No Issues Detected',
              photoUrl: 'https://via.placeholder.com/150'),
          RecentScan(
              date: '2024-11-20',
              result: 'Possible Melanoma',
              photoUrl: 'https://via.placeholder.com/150'),
        ]);

  void addScan(RecentScan scan) {
    state = [...state, scan];
  }
}
