import 'package:flutter/material.dart';
import 'package:todo_list_pomodoro/data/models/task.dart';

class ItemTask extends StatelessWidget {
  final Task task;

  const ItemTask({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), color: Colors.white),
      child: ListTile(
        leading: Checkbox(value: false, onChanged: (value) {}),
        minLeadingWidth: 0.0,
        horizontalTitleGap: 0.0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          task.content,
          maxLines: 1,
          style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              overflow: TextOverflow.ellipsis),
        ),
        trailing:
            IconButton(onPressed: () {}, icon: const Icon(Icons.play_circle)),
      ),
    );
  }
}
