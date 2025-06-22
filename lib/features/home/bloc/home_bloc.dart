import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:todo_list_pomodoro/features/home/bloc/home_event.dart';
import 'package:todo_list_pomodoro/features/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<Map> homeMenuMaps = [
    {'title': 'Hôm nay', 'value': 'today'},
    {'title': 'Ngày mai', 'value': 'tomorrow'},
    {'title': 'Tuần này', 'value': 'thisWeek'},
    {'title': 'Đã lên kế hoạch', 'value': 'planned'},
    {'title': 'Nhiệm vụ', 'value': 'task'},
  ];

  HomeBloc() : super(InitialHomeState()) {
    on<OnRequestPermissionEvent>(_onRequestPermission);
    on<OnHomeMenuLoadEvent>(_onHomeMenuLoad);
  }

  void _onRequestPermission(
      OnRequestPermissionEvent event, Emitter<HomeState> emitter) async {
    Permission.notification.request();
  }

  void _onHomeMenuLoad(OnHomeMenuLoadEvent event, Emitter<HomeState> emitter) {}
}
