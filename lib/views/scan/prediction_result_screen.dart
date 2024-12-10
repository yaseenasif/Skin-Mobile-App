import 'package:flutter/material.dart';

import '../../data/models/skin_disease.dart';

class PredictionResultScreen extends StatelessWidget {
  final SkinDisease predictedDisease;

  const PredictionResultScreen({super.key, required this.predictedDisease});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Disease: ${predictedDisease.name}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Description: ${predictedDisease.description ?? 'No information available'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Treatment: ${predictedDisease.treatment ?? 'NA'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              child: const Text('Back to Scan'),
            ),
          ],
        ),
      ),
    );
  }
}
