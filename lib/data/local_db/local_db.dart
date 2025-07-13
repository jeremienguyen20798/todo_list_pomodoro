import 'package:hive_ce/hive.dart';
import 'package:todo_list_pomodoro/data/models/label.dart';
import 'package:todo_list_pomodoro/data/models/task.dart';

class PomodoroTasksDB {
  //Thêm, sửa và xoá Label
  static Future<List<Label>> getLabels() async {
    final labelBox = await Hive.openBox<Label>('labels');
    return labelBox.values.toList();
  }

  static Future<void> addLabel(Label label) async {
    final labelBox = await Hive.openBox<Label>('labels');
    await labelBox.add(label);
  }

  static Future<void> editLabel() async {}

  static Future<void> deleteLabel() async {}

  //Thêm, sửa và xoá nhiệm vụ
  Future<void> addTask(Task task) async {
    final taskBox = await Hive.openBox<Task>("tasks");
    taskBox.add(task);
  }

  Future<void> editTask(Task task) async {
    await task.save();
  }

  Future<void> deleteTask(Task task) async {
    await task.delete();
  }

  Future<List<Task>> getTaskList() async {
    final taskBox = await Hive.openBox<Task>("tasks");
    final tasks = taskBox.values.toList();
    return tasks;
  }

  Future<int> getCountTaskByToDay() async {
    final tasks = await getTaskList();
    int count =
        tasks.where((item) => item.createAt == DateTime.now()).toList().length;
    return count;
  }

  Future<int> getCountTaskByTomorrow() async {
    final tasks = await getTaskList();
    int count = tasks
        .where((item) {
          final entity = item.toEntity();
          return entity.isTaskByTomorrow();
        })
        .toList()
        .length;
    return count;
  }

  Future<int> getCountTaskByThisWeek() async {
    final tasks = await getTaskList();
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
