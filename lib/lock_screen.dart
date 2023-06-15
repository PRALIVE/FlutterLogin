import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/viewmodel/notify.dart';
import 'package:http/http.dart' as http;

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  Future<void> delayedFunction() async {
    await Future.delayed(Duration(seconds: 5));
    // Call your function or perform the desired operation here
    Notify.instantNotify();
    Future.delayed(Duration(minutes: 1), () {
      AwesomeNotifications().dismiss(120);
      // Notify.instantNotify();
    });
  }

  Future<void> sendPushNotification(
      String deviceToken, String title, String body) async {
    final postUrl = 'https://fcm.googleapis.com/fcm/send';

    final data = {
      'notification': {
        'title': title,
        'body': body,
      },
      'to': deviceToken,
    };

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=YOUR_SERVER_KEY',
    };

    final response = await http.post(Uri.parse(postUrl),
        headers: headers, body: json.encode(data));

    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification. Error: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: InkWell(
                onTap: () {
                  delayedFunction();
                  //Notify.instantNotify();
                },
                child: Text("showNotification")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: InkWell(
                  onTap: () {
                    //sendNotification();
                  },
                  child: Text("send Push Notification")),
            ),
          ),
        ],
      ),
    );
  }
}
