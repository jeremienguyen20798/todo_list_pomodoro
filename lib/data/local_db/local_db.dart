import 'package:hive_ce/hive.dart';
import 'package:todo_list_pomodoro/data/models/label.dart';
import 'package:todo_list_pomodoro/data/models/task.dart';

class TodoTaskDB {
  static Future<List<Label>> getLabels() async {
    final labelBox = await Hive.openBox<Label>('labels');
    return labelBox.values.toList();
  }

  static Future<void> addLabel(Label label) async {
    final labelBox = await Hive.openBox<Label>('labels');
    await labelBox.add(label);
  }

  static Future<int> getCountTaskByToDay() async {
    final taskBox = await Hive.openBox<Task>('tasks');
    final tasks = taskBox.values.toList();
    int count =
        tasks.where((item) => item.createAt == DateTime.now()).toList().length;
    return count;
  }

  static Future<int> getCountTaskByTomorrow() async {
    final taskBox = await Hive.openBox<Task>('tasks');
    final tasks = taskBox.values.toList();
    int count = tasks
        .where((item) {
          final entity = item.toEntity();
          return entity.isTaskByTomorrow();
        })
        .toList()
        .length;
    return count;
  }

  static Future<int> getCountTaskByThisWeek() async {
    final taskBox = await Hive.openBox<Task>('tasks');
    final tasks = taskBox.values.toList();
    int count = tasks
        .where((item) {
          final entity = item.toEntity();
          return entity.isTaskByThisWeek();
        })
        .toList()
        .length;
    return count;
  }
}
