import '../../../data/models/task.dart';

abstract class TaskEvent {}

class OnSaveTaskEvent extends TaskEvent {
  final String taskTitle;
  final String taskContent;
  final int numberOfPomodoro;

  OnSaveTaskEvent(this.taskTitle, this.taskContent, this.numberOfPomodoro);
}

class OnChangeNumberOfPomodoroEvent extends TaskEvent {
  int numberOfPomodoro;
  OnChangeNumberOfPomodoroEvent(this.numberOfPomodoro);
}

class OnConfirmTaskEvent extends TaskEvent {
  final Task task;

  OnConfirmTaskEvent(this.task);
}
