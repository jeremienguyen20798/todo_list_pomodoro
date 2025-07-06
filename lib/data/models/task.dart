import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list_pomodoro/data/models/label.dart';
import 'package:todo_list_pomodoro/data/models/pomodoro.dart';
import 'package:todo_list_pomodoro/domain/entities/task_entity.dart';
import 'package:uuid/uuid.dart';

part 'task.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Task extends HiveObject{
  @JsonKey(name: 'id')
  @HiveField(0)
  final String id = const Uuid().v1();
  @JsonKey(name: 'content')
  @HiveField(1)
  final String content;
  @JsonKey(name: 'labels')
  @HiveField(2)
  List<Label>? labels;
  @JsonKey(name: 'pomodoro')
  @HiveField(3)
  Pomodoro? pomodoro;
  @JsonKey(name: 'status')
  @HiveField(4)
  int? status;
  @JsonKey(name: 'start')
  @HiveField(5)
  DateTime? start;
  @JsonKey(name: 'end')
  @HiveField(6)
  DateTime? end;
  @JsonKey(name: 'create_at')
  @HiveField(7)
  DateTime createAt = DateTime.now();
  @JsonKey(name: 'is_alarm')
  @HiveField(8)
  bool? isAlarm;
  @JsonKey(name: 'is_repeat')
  @HiveField(9)
  bool? isRepeat;

  Task(
      {required this.content,
      this.labels,
      this.pomodoro,
      this.status,
      this.start,
      this.end,
      this.isAlarm,
      this.isRepeat});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
  
  TaskEntity toEntity() {
    return TaskEntity(
      content: content,
      labels: labels ?? [],
      pomodoro: pomodoro,
      status: status,
      start: start,
      end: end,
      isAlarm: isAlarm,
      isRepeat: isRepeat,
    );
  }
}
