import 'package:equatable/equatable.dart';

import '../../../data/models/task.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialHomeState extends HomeState {}

class AddTaskState extends HomeState {
  final List<Task> tasks;

  AddTaskState(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

class GetAllTaskState extends HomeState {
  final List<Task> tasks;

  GetAllTaskState(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

class DeleteTaskState extends HomeState {
  final List<Task> tasks;

  DeleteTaskState(this.tasks);

  @override
  List<Object?> get props => [tasks];
}
