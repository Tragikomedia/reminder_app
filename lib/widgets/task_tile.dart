import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/models/task.dart';
import 'package:reminder_app/provider/task_provider.dart';
import 'package:reminder_app/utilities/colors.dart';
import 'package:reminder_app/widgets/discard_button.dart';
import 'package:reminder_app/widgets/my_text.dart';
import 'package:reminder_app/widgets/timer_display.dart';
import 'package:easy_localization/easy_localization.dart';
import 'my_div.dart';

class TaskTile extends StatelessWidget {
  final int taskNumber;

  TaskTile({@required this.taskNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [lighterBackgroundColor, backgroundColor, darkerBackgroundColor]
        ),
        color: backgroundColor,
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
                MyText(text: task.name,
                  size: 26,
                  color: primaryColor,
                  softWrap: true,),
                MyDiv(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ Spacer(), MyText(text: "start".tr() + ": " +
                      task.start.hour.toString() +
                      ":" + task.start.minute.toString().padLeft(2, '0'),
                    size: 15,),
                    Spacer(),
                    MyText(text: "end".tr() + ": " + task.end.hour.toString() +
                        ":" + task.end.minute.toString().padLeft(2, '0'),
                      size: 15,),
                    Spacer(),
                  ],
                ),
                Divider(color: primaryColor, thickness: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Spacer(),
                    // Unique key is used so that state will update when task is added/deleted.
                    TimerDisplay(task: task, key: UniqueKey(),),
                    Spacer(),
                    DiscardButton(task: task,)
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
