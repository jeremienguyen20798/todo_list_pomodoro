import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_pomodoro/features/task/bloc/task_bloc.dart';
import 'package:todo_list_pomodoro/features/task/bloc/task_state.dart';

import '../../../data/models/task.dart';
import '../../../shared/items/item_task.dart';
import '../../../shared/widgets/general/empty_view.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = [];
        if (state is AddTaskStateSuccess) {
          taskList.add(state.task);
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
