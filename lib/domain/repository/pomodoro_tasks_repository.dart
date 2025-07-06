import 'package:todo_list_pomodoro/data/models/label.dart';

abstract class PomodoroTasksRepository {
  Future<List<Label>> getLabels();
  Future<void> addLabel(Label label);
  Future<int> getCountTaskByToDay();
  Future<int> getCountTaskByTomorrow();
  Future<int> getCountTaskByThisWeek();
}