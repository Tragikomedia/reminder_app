import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/models/task.dart';
import 'package:reminder_app/provider/task_provider.dart';
import 'package:reminder_app/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, tasks, child) {
        return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            itemCount: tasks.listLength,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: TaskTile(task: tasks.getTask(index)),
            ));
      },
    );
  }
}
