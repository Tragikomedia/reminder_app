import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/provider/task_provider.dart';
import 'package:reminder_app/utilities/colors.dart';
import 'package:reminder_app/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        border: Border(top: BorderSide(color: primaryColor, width: 1,), bottom: BorderSide(color: primaryColor, width: 1))
      ),
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          itemCount: Provider.of<TaskProvider>(context).listLength,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: TaskTile(
                  taskNumber: index,
                ),
              )),
    );
  }
}
