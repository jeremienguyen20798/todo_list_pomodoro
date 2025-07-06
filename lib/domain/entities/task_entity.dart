import 'package:todo_list_pomodoro/data/models/label.dart';
import 'package:todo_list_pomodoro/data/models/pomodoro.dart';
import 'package:todo_list_pomodoro/shared/constants/app_constants.dart';

class TaskEntity {
  final String content;
  final List<Label> labels;
  final Pomodoro? pomodoro;
  // 0: Đang thực hiện, 1: Đã hoàn thành, 2: Đã huỷ. Mặc định là null
  final int? status;
  final DateTime? start;
  final DateTime? end;
  final DateTime createAt = DateTime.now();
  final bool? isAlarm;
  final bool? isRepeat;

  TaskEntity({
    required this.content,
    required this.labels,
    this.pomodoro,
    this.status,
    this.start,
    this.end,
    this.isAlarm,
    this.isRepeat,
  });

  int getTaskTime() {
    if (start == null || end == null) {
      return 0;
    }
    return end!.difference(start!).inSeconds;
  }

  bool isTaskByTomorrow() {
    return createAt.day == DateTime.now().day + 1;
  }

  bool isTaskByThisWeek() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    return createAt.isAfter(startOfWeek) && createAt.isBefore(endOfWeek);
  }

  String getTaskStatus(int value) {
    switch (value) {
      case 0:
        return AppConstants.progress;
      case 1:
        return AppConstants.completed;
      case 2:
        return AppConstants.cancelled;
      default:
        return AppConstants.progress;
    }
  }
}
