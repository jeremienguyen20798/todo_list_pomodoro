import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_pomodoro/hive_registrar.g.dart';
import 'package:todo_list_pomodoro/main.dart';

class DependencyInjection {
  static Future<void> setUp() async {
    await AndroidAlarmManager.initialize();
    final prefs = await SharedPreferences.getInstance();
    getIt.registerSingleton<SharedPreferences>(prefs);
    final directory = await getApplicationDocumentsDirectory();
    Hive
      ..init(directory.path)
      ..registerAdapters();
  }
}
