import 'dart:async';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_pomodoro/app.dart';
import 'package:todo_list_pomodoro/hive_registrar.g.dart';
import 'package:todo_list_pomodoro/shared/utils/notification_utils.dart';

@pragma('vm:entry-point')
void showNotification(int id, Map<String, dynamic> data) async {
  final id = data['id'] as int;
  final title = data['content'] as String;
  NotificationUtils.showNotification(
      id, title, "Hãy bắt đầu 5 phút nghỉ ngơi để lấy lại năng lượng nào !!!");
}

@pragma('vm:entry-point')
void onNotificationClicked(NotificationResponse response) {

}

final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  await NotificationUtils.initNotifications();
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapters();
  runApp(const MyApp());
}

