class NotificationService {
  final List<Map<String, String>> _mockNotifications = [
    {'title': 'Daily Reminder', 'time': '8:00 AM'},
    {'title': 'Check Your Skin', 'time': '6:00 PM'},
  ];

  Future<List<Map<String, String>>> fetchNotifications() async {
    await Future.delayed(const Duration(seconds: 2)); // Mock delay
    return _mockNotifications;
  }

  Future<void> addNotification(String title, String time) async {
    await Future.delayed(const Duration(seconds: 1)); // Mock delay
    _mockNotifications.add({'title': title, 'time': time});
  }
}
