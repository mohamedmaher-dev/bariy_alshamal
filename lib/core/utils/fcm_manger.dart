// ignore_for_file: use_build_context_synchronously

import 'package:bariy_alshamal/core/utils/print.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class FCMManger {
  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  static init() async {
    await _requestPermission();
    await _getToken();
    await _foregroundFCM();
    await _subscribeToAll();
  }

  static Future<void> _requestPermission() async {
    await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  static Future<void> _foregroundFCM() async {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        if (message.notification != null) {
          DebugPrint.white(message.toMap().toString());
          EasyLoading.showInfo(
            message.notification!.body!,
            duration: const Duration(seconds: 5),
          );
        } else {
          DebugPrint.error("Foreground FCM Not Working");
        }
      },
    );
  }

  static Future<void> _subscribeToAll() async {
    await _fcm.subscribeToTopic("all");
  }

  static Future<void> _getToken() async {
    String? token = await _fcm.getToken();
    DebugPrint.success(token.toString());
  }

  static send({required String title, required String body}) async {
    final Dio dio = Dio();
    const String fcmUrl = "https://fcm.googleapis.com/fcm/send";
    const String serverToken =
        "AAAApEPzVD8:APA91bES5Jq8TW4SJZDj1XnYIeifYV5RSbAuAHmRnfYk45aokVIIe_uT5H7adAtRGAHbZnOONnDG9iOKyTUWuQwTk6YY0UlGx_ccn17q981CB7QM-ugI99gmyl7Sbm01aRHSv70mY0zI";
    await dio.post(
      fcmUrl,
      options: Options(
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverToken',
        },
      ),
      data: <String, dynamic>{
        'notification': <String, dynamic>{
          'body': body,
          'title': title,
        },
        'priority': 'high',
        'data': <String, dynamic>{
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'id': '1',
          'status': 'done'
        },
        'to': "/topics/all",
      },
    );
  }
}
