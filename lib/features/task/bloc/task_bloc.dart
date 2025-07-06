import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_pomodoro/data/models/task.dart';
import 'package:todo_list_pomodoro/features/task/bloc/task_event.dart';
import 'package:todo_list_pomodoro/features/task/bloc/task_state.dart';

import '../../../main.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final prefs = getIt.get<SharedPreferences>();

  TaskBloc() : super(InitialCreateTaskState()) {
    on<OnSaveTaskEvent>(_onSaveTask);
  }

  Future<void> _onSaveTask(
      OnSaveTaskEvent event, Emitter<TaskState> emitter) async {
    final task = Task(content: event.taskContent);
    emitter(AddTaskStateSuccess(task));
  }
}
