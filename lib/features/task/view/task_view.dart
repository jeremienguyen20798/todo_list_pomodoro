import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_pomodoro/features/task/bloc/task_bloc.dart';
import 'package:todo_list_pomodoro/features/task/bloc/task_event.dart';
import 'package:todo_list_pomodoro/features/task/widgets/task_list.dart';
import 'package:todo_list_pomodoro/features/task/widgets/task_statistical.dart';
import 'package:todo_list_pomodoro/shared/constants/app_constants.dart';
import 'package:todo_list_pomodoro/shared/widgets/general/custom_app_bar.dart';

import '../../../data/models/task.dart';

class TaskView extends StatefulWidget {
  final String title;
  final Task? task;
  const TaskView({super.key, required this.title, this.task});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.title),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16.0),
              const TaskStatistical(),
              const SizedBox(height: 16.0),
              Container(
                color: Colors.white,
                child: TextFormField(
                  controller: contentController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.add, color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                    hintText: AppConstants.inputTaskTitle,
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                  onFieldSubmitted: (value) {
                    context.read<TaskBloc>().add(OnSaveTaskEvent(value));
                    contentController.clear();
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              const TaskList(),
            ],
          )),
    );
  }
}
