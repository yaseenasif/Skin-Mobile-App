import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': 'How does the app work?',
      'answer': 'It uses AI to detect skin conditions.'
    },
    {
      'question': 'How to scan my skin?',
      'answer': 'Go to the Scan section and follow instructions.'
    },
    {
      'question': 'Is my data secure?',
      'answer': 'Yes, we prioritize user data privacy.'
    },
  ];

  FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(faqs[index]['question']!),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(faqs[index]['answer']!),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
