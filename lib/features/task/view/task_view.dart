import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_pomodoro/features/task/bloc/task_bloc.dart';
import 'package:todo_list_pomodoro/features/task/bloc/task_event.dart';
import 'package:todo_list_pomodoro/features/task/bloc/task_state.dart';
import 'package:todo_list_pomodoro/shared/constants/app_constants.dart';

import '../../../data/models/task.dart';

class TaskView extends StatefulWidget {
  final Task? task;
  const TaskView({super.key, this.task});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  int numberOfPomodoros = 1;

  @override
  void initState() {
    if (widget.task != null) {
      contentController.text = widget.task!.content;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
              color: Colors.black),
          title: const Text(
            AppConstants.addTask,
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
        ),
        body: BlocConsumer<TaskBloc, TaskState>(builder: (context, state) {
          if (state is ChangeNumberOfTasksState) {
            numberOfPomodoros = state.numberOfTasks;
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: taskTitleController,
                  decoration: InputDecoration(
                    labelText: AppConstants.titleTask,
                    hintText: AppConstants.inputTaskTitle,
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 14.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: contentController,
                  decoration: InputDecoration(
                    labelText: AppConstants.contentTask,
                    hintText: AppConstants.inputContent,
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 14.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                  ),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(AppConstants.numberPomodoro,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                  subtitle: RichText(
                      text: const TextSpan(
                          text: AppConstants.note,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          children: [
                        TextSpan(
                            text: AppConstants.star,
                            style: TextStyle(color: Colors.red, fontSize: 12)),
                        TextSpan(
                            text: AppConstants.pomodoro,
                            style:
                                TextStyle(color: Colors.black, fontSize: 12)),
                      ])),
                  trailing: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<TaskBloc>().add(
                                OnChangeNumberOfPomodoroEvent(
                                    numberOfPomodoros - 1));
                          },
                          icon: const Icon(Icons.remove, color: Colors.black)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          numberOfPomodoros.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            context.read<TaskBloc>().add(
                                OnChangeNumberOfPomodoroEvent(
                                    numberOfPomodoros + 1));
                          },
                          icon: const Icon(Icons.add, color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          );
        }, listener: (context, state) {
          if (state is AddTaskStateSuccess) {
            Navigator.pop(context, state.task);
          }
        }),
        persistentFooterButtons: [
          MaterialButton(
            onPressed: taskTitleController.text.isNotEmpty &&
                    contentController.text.isNotEmpty
                ? () {
                    context.read<TaskBloc>().add(OnSaveTaskEvent(
                        taskTitleController.text,
                        contentController.text,
                        numberOfPomodoros));
                  }
                : null,
            disabledTextColor: Colors.black,
            disabledColor: Colors.grey,
            color: Colors.deepPurple,
            textColor: Colors.white,
            minWidth: MediaQuery.of(context).size.width,
            height: 48.0,
            child: const Text(AppConstants.save),
          )
        ]);
  }
}
