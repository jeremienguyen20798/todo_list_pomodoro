import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'label.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class Label extends HiveObject {
  @HiveField(0)
  final String label;
  //Mã màu dạng hex color
  @HiveField(1)
  final String color;

  Label({required this.label, required this.color});

  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);
  Map<String, dynamic> toJson() => _$LabelToJson(this);
}
