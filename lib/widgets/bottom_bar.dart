import 'package:flutter/material.dart';
import 'package:reminder_app/provider/task_provider.dart';
import 'package:reminder_app/views/add_task_view.dart';
import 'package:reminder_app/widgets/bar_button.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<TaskProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BarButton(text: 'eraseall'.tr(), onPressed: tasks.removeAllTasks),
        BarButton(text: 'add'.tr(), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskView()));
        })
      ],
    );
  }
}
