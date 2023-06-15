import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class Notify {
  static Future<bool> instantNotify() async {
    final AwesomeNotifications awesomeNotification = AwesomeNotifications();

    return awesomeNotification.createNotification(
        actionButtons: <NotificationActionButton>[
          NotificationActionButton(
              key: 'accept',
              label: 'Accept',
              actionType: ActionType.SilentBackgroundAction),
          NotificationActionButton(
              key: 'reject',
              label: 'Reject',
              actionType: ActionType.SilentBackgroundAction),
        ],
        content: NotificationContent(
            id: 133,
            largeIcon: "asset://images/product2.webp",
            payload: {
              "navigate": "true",
            },
            bigPicture: "asset://images/product1.webp",
            title: "My Notification",
            notificationLayout: NotificationLayout.BigPicture,
            backgroundColor: const Color.fromARGB(255, 54, 244, 89),
            body: "Hello there click here",
            channelKey: 'instant_notification_11'));
  }

  static Future<bool> instantNotifyInfo(String title, String body) async {
    final AwesomeNotifications awesomeNotification = AwesomeNotifications();

    return awesomeNotification.createNotification(
        actionButtons: <NotificationActionButton>[
          NotificationActionButton(
              key: 'accept',
              label: 'Accept',
              actionType: ActionType.SilentBackgroundAction),
          NotificationActionButton(
              key: 'reject',
              label: 'Reject',
              actionType: ActionType.SilentBackgroundAction),
        ],
        content: NotificationContent(
            id: 120,
            largeIcon: "asset://images/product2.webp",
            payload: {
              "navigate": "true",
            },
            bigPicture: "asset://images/product1.webp",
            title: title,
            notificationLayout: NotificationLayout.BigPicture,
            backgroundColor: const Color.fromARGB(255, 54, 244, 89),
            body: body,
            channelKey: 'instant_notification_11'));
  }
}
