import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_pomodoro/data/models/task.dart';
import 'package:todo_list_pomodoro/features/task/bloc/task_event.dart';
import 'package:todo_list_pomodoro/features/task/bloc/task_state.dart';
import 'package:todo_list_pomodoro/shared/constants/app_constants.dart';

import '../../../main.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final prefs = getIt.get<SharedPreferences>();

  TaskBloc() : super(InitialCreateTaskState()) {
    on<OnChangeNumberOfPomodoroEvent>(_onChangeNumberOfPomodoros);
    on<OnSaveTaskEvent>(_onSaveTask);
    on<OnConfirmTaskEvent>(_onEditConfirmTask);
  }

  Future<void> _onChangeNumberOfPomodoros(
      OnChangeNumberOfPomodoroEvent event, Emitter<TaskState> emit) async {
    if (event.numberOfPomodoro > 0) {
      prefs.setInt(AppConstants.numberOfPomodoroKey, event.numberOfPomodoro);
      emit(ChangeNumberOfTasksState(event.numberOfPomodoro));
    }
  }

  Future<void> _onSaveTask(
      OnSaveTaskEvent event, Emitter<TaskState> emitter) async {
    final task = Task(content: event.taskContent);
    emitter(AddTaskStateSuccess(task));
  }

  void _onEditConfirmTask(
      OnConfirmTaskEvent event, Emitter<TaskState> emitter) {
    emitter(ConfirmEditTaskState(event.task));
  }
}
