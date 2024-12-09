import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../data/providers/recent_scans_provider.dart';
import '../../shared/widgets/custom_button.dart';
import 'widgets/recent_scan_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentScans = ref.watch(recentScansProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Melanoma Detection',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Early detection makes a difference. Upload a photo to analyze.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Start Scan',
              onPressed: () => Navigator.pushNamed(context, '/scan'),
            ),
            const SizedBox(height: 30),
            const Text(
              'Fitzpatrick Test',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Determine your skin type using the Fitzpatrick Scale.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Scans',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (recentScans.isEmpty)
              const Center(
                child: Text(
                  'No recent scans available.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recentScans.length,
                itemBuilder: (context, index) {
                  final scan = recentScans[index];
                  return RecentScanCard(scan: scan);
                },
              ),
          ],
        ),
      ),
    );
  }
}
