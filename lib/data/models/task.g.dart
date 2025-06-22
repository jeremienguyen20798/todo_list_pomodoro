// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      content: fields[1] as String,
      labels: (fields[2] as List?)?.cast<Label>(),
      pomodoro: fields[3] as Pomodoro?,
      status: (fields[4] as num?)?.toInt(),
      start: fields[5] as DateTime?,
      end: fields[6] as DateTime?,
      isAlarm: fields[8] as bool?,
      isRepeat: fields[9] as bool?,
    )..createAt = fields[7] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(9)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.labels)
      ..writeByte(3)
      ..write(obj.pomodoro)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.start)
      ..writeByte(6)
      ..write(obj.end)
      ..writeByte(7)
      ..write(obj.createAt)
      ..writeByte(8)
      ..write(obj.isAlarm)
      ..writeByte(9)
      ..write(obj.isRepeat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
