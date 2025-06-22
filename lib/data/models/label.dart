import 'package:hive_ce/hive.dart';

part 'label.g.dart';

@HiveType(typeId: 2)
class Label extends HiveObject {
  @HiveField(0)
  final String label;
  //Mã màu dạng hex
  @HiveField(1)
  final String color;

  Label({required this.label, required this.color});


}
