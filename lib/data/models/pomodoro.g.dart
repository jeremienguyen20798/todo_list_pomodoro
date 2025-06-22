// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pomodoro.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PomodoroAdapter extends TypeAdapter<Pomodoro> {
  @override
  final int typeId = 1;

  @override
  Pomodoro read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pomodoro(
      (fields[0] as num).toInt(),
      (fields[1] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Pomodoro obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.numberOfPomodoro)
      ..writeByte(1)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PomodoroAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
