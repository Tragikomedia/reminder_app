import 'package:flutter/material.dart';
import 'package:reminder_app/models/task.dart';
import 'package:reminder_app/provider/task_provider.dart';
import 'package:reminder_app/utilities/colors.dart';
import 'package:provider/provider.dart';

class DiscardButton extends StatelessWidget {
  final Task task;
  final bool isDone;

  DiscardButton({@required this.task,  this.isDone=false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<TaskProvider>(context, listen: false).removeTask(task);
      },
      child: Icon(
        Icons.highlight_off,
        size: 30.0,
        color: isDone ? borderColor : Colors.red,
      ),
    );
  }
}
