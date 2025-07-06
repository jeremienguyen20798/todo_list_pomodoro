import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pomodoro.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Pomodoro extends HiveObject {
  @HiveField(0)
  int numberOfPomodoro;
  @HiveField(1)
  int time;

  Pomodoro(this.numberOfPomodoro, this.time);

  factory Pomodoro.fromJson(Map<String, dynamic> json) => _$PomodoroFromJson(json);
  Map<String, dynamic> toJson() => _$PomodoroToJson(this);
}
