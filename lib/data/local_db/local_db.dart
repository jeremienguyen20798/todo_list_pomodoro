import 'package:hive_ce/hive.dart';
import 'package:todo_list_pomodoro/data/models/label.dart';

class TodoTaskDB {
  
  static Future<List<Label>> getLabels() async {
    final labelBox = await Hive.openBox<Label>('labels');
    return labelBox.values.toList();
  }
}
