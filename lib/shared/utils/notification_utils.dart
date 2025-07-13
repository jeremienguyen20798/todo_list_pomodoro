import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_pomodoro/main.dart';

import '../constants/app_constants.dart';
import 'app_utils.dart';

class NotificationUtils {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final prefs = getIt.get<SharedPreferences>();

  static Future<void> initNotifications() async {
    // Request permission
    // await flutterLocalNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<
    //         AndroidFlutterLocalNotificationsPlugin>()
    //     ?.requestNotificationsPermission();
    // const AndroidInitializationSettings initializationSettingsAndroid =
    //     AndroidInitializationSettings('@mipmap/ic_launcher');
    // const InitializationSettings initializationSettings =
    //     InitializationSettings(android: initializationSettingsAndroid);
    // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //     onDidReceiveBackgroundNotificationResponse: onNotificationClicked,
    //     onDidReceiveNotificationResponse: onNotificationClicked);
  }

  static Future<void> showNotification(
      int notificationId, String title, String body) async {
    int remaining = 5 * 60;
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (remaining < 0 || remaining == 0) {
        int numberOfPomodoro =
            prefs.getInt(AppConstants.numberOfPomodoroKey) ?? 0;
        numberOfPomodoro--;
        if (numberOfPomodoro == 0) {
          timer.cancel();
          await flutterLocalNotificationsPlugin
              .cancel(0); // Hủy thông báo sau khi đếm xong
          return;
        }
      }
      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
              AppConstants.id, AppConstants.notificationName,
              channelDescription: AppConstants.notificationDesc,
              playSound: false,
              ongoing: true,
              importance: Importance.max,
              priority: Priority.high,
              actions: [
            AndroidNotificationAction('id', AppUtils.formatTime(remaining))
          ]);
      NotificationDetails notificationDetails =
          NotificationDetails(android: androidNotificationDetails);
      await flutterLocalNotificationsPlugin.show(
          0, title, body, notificationDetails);
      remaining--;
    });
  }
}
