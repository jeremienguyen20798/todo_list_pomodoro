import 'package:hive_ce/hive.dart';
import 'package:todo_list_pomodoro/data/models/label.dart';
import 'package:todo_list_pomodoro/data/models/pomodoro.dart';
import 'package:uuid/uuid.dart';

import '../../shared/constants/app_constants.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
// ignore: must_be_immutable
class Task extends HiveObject {
  @HiveField(0)
  final String id = const Uuid().v1();
  @HiveField(1)
  final String content;
  @HiveField(2)
  List<Label>? labels;
  @HiveField(3)
  Pomodoro? pomodoro;
  // 0: Đang thực hiện, 1: Đã hoàn thành, 2: Đã huỷ. Mặc định là null
  @HiveField(4)
  int? status;
  @HiveField(5)
  DateTime? start;
  @HiveField(6)
  DateTime? end;
  @HiveField(7)
  DateTime createAt = DateTime.now();
  @HiveField(8)
  bool? isAlarm;
  @HiveField(9)
  bool? isRepeat;

  Task(
      {required this.content,
      this.labels,
      this.pomodoro,
      this.status,
      this.start,
      this.end,
      this.isAlarm,
      this.isRepeat});

  int getTaskTime() {
    if (start == null || end == null) {
      return 0;
    }
    return end!.difference(start!).inSeconds;
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
