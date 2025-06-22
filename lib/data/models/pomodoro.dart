import 'package:hive_ce/hive.dart';

part 'pomodoro.g.dart';

@HiveType(typeId: 1)
class Pomodoro extends HiveObject {
  @HiveField(0)
  int numberOfPomodoro;
  @HiveField(1)
  int time;

  Pomodoro(this.numberOfPomodoro, this.time);
}
