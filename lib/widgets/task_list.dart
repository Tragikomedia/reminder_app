import 'package:flutter/material.dart';
import 'package:reminder_app/models/task.dart';
import 'package:reminder_app/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> testList = [
    Task(
        name: 'Imię',
        number: 0,
        start: DateTime(2020, 10, 23, 15, 10),
        end: DateTime(2020, 10, 23, 15, 50)),
    Task(
        name: 'Lel',
        number: 1,
        start: DateTime(2020, 10, 23, 18, 2),
        end: DateTime(2020, 10, 23, 18, 50, 24))
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: testList.length,
        itemBuilder: (context, index) => TaskTile(task: testList[index]));
  }
}
