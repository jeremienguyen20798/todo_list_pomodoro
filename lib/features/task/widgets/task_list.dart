import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_pomodoro/features/home/bloc/home_bloc.dart';
import 'package:todo_list_pomodoro/features/home/bloc/home_state.dart';

import '../../../data/models/task.dart';
import '../../../shared/items/item_task.dart';
import '../../../shared/widgets/general/empty_view.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        List<Task> taskList = [];
        if (state is GetAllTaskState) {
          taskList = state.tasks;
        } else if (state is AddTaskState) {
          taskList = state.tasks;
        } else if (state is DeleteTaskState) {
          taskList = state.tasks;
        }
        return taskList.isNotEmpty
            ? ListView.separated(
                shrinkWrap: true,
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return ItemTask(task: taskList[index]);
                },
                separatorBuilder: (context, index) => const Divider())
            : const EmptyView();
      },
    );
  }
}
