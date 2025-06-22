import 'package:equatable/equatable.dart';

import '../../../data/models/task.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class InitialCreateTaskState extends TaskState {}

class ChangeNumberOfTasksState extends TaskState {
  final int numberOfTasks;

  const ChangeNumberOfTasksState(this.numberOfTasks);

  @override
  List<Object> get props => [numberOfTasks];
}

class AddTaskStateSuccess extends TaskState {
  final Task task;

  const AddTaskStateSuccess(this.task);

  @override
  List<Object> get props => [task];
}

class ConfirmEditTaskState extends TaskState {
  final Task task;

  const ConfirmEditTaskState(this.task);

  @override
  List<Object> get props => [task];
}
