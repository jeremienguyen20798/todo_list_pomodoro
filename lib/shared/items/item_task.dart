import 'package:flutter/material.dart';
import 'package:todo_list_pomodoro/data/models/task.dart';

class ItemTask extends StatelessWidget {
  final Task task;

  const ItemTask({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 12.0),
      title: Text(
        task.content,
        maxLines: 1,
        style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis),
      ),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
    );
  }
}
