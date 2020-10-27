import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/models/task.dart';
import 'package:reminder_app/provider/task_provider.dart';
import 'package:reminder_app/utilities/colors.dart';
import 'package:reminder_app/widgets/discard_button.dart';
import 'package:reminder_app/widgets/my_text.dart';
import 'package:reminder_app/widgets/timer_display.dart';

class TaskTile extends StatelessWidget {
  final int taskNumber;

  TaskTile({@required this.taskNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TaskProvider>(
          builder: (context, provider, child) {
            Task task = provider.getTask(taskNumber);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(text: task.name, size: 26, color: secondaryColor, softWrap: true,),
                Divider(color: secondaryColor,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(text: "START: " + task.start.hour.toString() +
                              ":" + task.start.minute.toString().padLeft(2, '0'), size: 15,),
                          MyText(text: "END: " + task.end.hour.toString() +
                              ":" + task.end.minute.toString().padLeft(2, '0'), size: 15,),
                        ],
                      ),
                    ),
                    TimerDisplay(task: task, key: UniqueKey(),),
                    SizedBox(width: 10,),
                    DiscardButton(task: task,)
                  ],
                )],
            );
          },
        ),
      ),
    );
  }
}
