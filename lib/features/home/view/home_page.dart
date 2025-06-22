import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_pomodoro/features/home/bloc/home_bloc.dart';
import 'package:todo_list_pomodoro/features/home/bloc/home_event.dart';
import 'package:todo_list_pomodoro/features/home/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (_) => HomeBloc()
            ..add(OnRequestPermissionEvent())
            ..add(OnHomeMenuLoadEvent())),
    ], child: const HomeView());
  }
}
