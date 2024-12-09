import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<String> notifications = [
    'Reminder: Scan your skin today!',
    'Your last scan showed no issues. Great job!',
    'Don\'t forget to apply sunscreen regularly.',
  ];

  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(notifications[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logic to add a new notification
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Create a notification feature pending')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
