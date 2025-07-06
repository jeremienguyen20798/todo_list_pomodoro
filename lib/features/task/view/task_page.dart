import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_pomodoro/data/models/task.dart';
import 'package:todo_list_pomodoro/features/task/bloc/task_bloc.dart';
import 'package:todo_list_pomodoro/features/task/view/task_view.dart';

class TaskPage extends StatelessWidget {
  final String title;
  final Task? task;
  const TaskPage({super.key, required this.title, this.task});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskBloc(),
      child: TaskView(title: title, task: task),
    );
  }
}
