import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/handlers/notification_handler.dart';
import 'package:reminder_app/models/task.dart';
import 'package:reminder_app/provider/task_provider.dart';
import 'package:reminder_app/utilities/colors.dart';
import 'package:reminder_app/widgets/add_cancel_buttons.dart';
import 'package:reminder_app/widgets/my_text.dart';
import 'package:reminder_app/widgets/pick_date_box.dart';
import 'package:reminder_app/widgets/task_name_box.dart';
import 'package:workmanager/workmanager.dart';

class AddTaskView extends StatefulWidget {
  @override
  _AddTaskViewState createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  TextEditingController _controller;
  TimeOfDay startTime;
  TimeOfDay endTime;

  _addTask(BuildContext context) {
    if (startTime != null && endTime != null) {
      DateTime now = DateTime.now();
      DateTime start = DateTime(
          now.year, now.month, now.day, startTime.hour, startTime.minute);
      DateTime end =
          DateTime(now.year, now.month, now.day, endTime.hour, endTime.minute);
      if (now.isAfter(start.add(Duration(minutes: 5)))) {
        start = start.add(Duration(days: 1));
      }
      // Else if is used to avoid the notification being 0-60 seconds late
      else if (now.difference(start).compareTo(Duration(seconds: 59)) < 0 && now.minute == start.minute && now.hour == start.hour) {
        start = start.add(now.difference(start));
      }
      while (start.isAfter(end)) {
        end = end.add(Duration(days: 1));
      }
      var provider = Provider.of<TaskProvider>(context, listen: false);
        int number = provider.getNumber();
        provider.addTask(Task(
            number: number,
            name: _controller.value.text,
            start: start,
            end: end));
    } else {
      throw Error();
    }
  }

  @override
  void initState() {
    Workmanager.initialize(callbackDispatcher);
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkerColor,
      body: SafeArea(
        child: Column(
          children: [
            MyText(
              text: 'ADD TASK',
              color: primaryColor,
              size: 35.0,
            ),
            Divider(
              color: secondaryColor,
            ),
            TaskNameBox(controller: _controller),
            PickDateBox(
                text: 'START',
                onTap: () async {
                  TimeOfDay time = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                  setState(() {
                    startTime = time;
                  });
                },
                date: startTime != null ? startTime.format(context) : "--:--"),
            PickDateBox(
                text: 'END',
                onTap: () async {
                  TimeOfDay time = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                  setState(() {
                    endTime = time;
                  });
                },
                date: endTime != null ? endTime.format(context) : "--:--"),
            AddCancelButtons(
              addTask: () {
                _addTask(context);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
