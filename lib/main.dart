import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/home_page.dart';
import 'package:flutter_login/service/notification_service.dart';
import 'package:flutter_login/viewmodel/notify.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationService.initializeNotification();
  FirebaseMessaging.onBackgroundMessage(_firebasemessagingbackgroundHandler);
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebasemessagingbackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  String title = message.notification!.title.toString();
  String body = message.notification!.body.toString();
  Notify.instantNotifyInfo(title, body);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // Only after at least the action method is set, the notification events are delivered
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationService.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationService.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationService.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationService.onDismissActionReceivedMethod);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
