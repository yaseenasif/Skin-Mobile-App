import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/notification_service.dart';

final notificationServiceProvider =
    Provider<NotificationService>((ref) => NotificationService());

final notificationsProvider =
    FutureProvider<List<Map<String, String>>>((ref) async {
  return ref.watch(notificationServiceProvider).fetchNotifications();
});
