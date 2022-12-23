import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AccessNoftification {
  //class object.
  AccessNoftification._();

//class singleton
  static final AccessNoftification fcm = AccessNoftification._();

  void loadmessage() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications',
      description: "This channel is used for important notifications.", // title
      importance: Importance.high,
    );
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(channel.id, channel.name,
                  channelDescription: channel.description,
                  icon: android.smallIcon,
                  priority: Priority.high,
                  importance: Importance.high
                  // other properties...
                  ),
            ));
      }
    });
  }
}

class Token {
  Token._();
//class singleton
  static final Token token = Token._();
  final _firestore = FirebaseFirestore.instance.collection("notification");

  Future<void> getToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    _firestore.doc("notify").set({"token": fcmToken, "time": Timestamp.now()});
  }
}
