import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/handlers/notification_handler.dart';
import 'package:reminder_app/handlers/task_handler.dart';
import 'package:reminder_app/models/task.dart';
import 'package:reminder_app/provider/task_provider.dart';
import 'package:reminder_app/utilities/colors.dart';
import 'package:reminder_app/utilities/consts.dart';
import 'package:reminder_app/widgets/add_cancel_buttons.dart';
import 'package:reminder_app/widgets/my_div.dart';
import 'package:reminder_app/widgets/my_text.dart';
import 'package:reminder_app/widgets/pick_date_box.dart';
import 'package:reminder_app/widgets/task_name_box.dart';
import 'package:workmanager/workmanager.dart';
import 'package:easy_localization/easy_localization.dart';

class AddTaskView extends StatefulWidget {
  @override
  _AddTaskViewState createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  TextEditingController _controller;
  TimeOfDay startTime;
  TimeOfDay endTime;


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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [lighterBackgroundColor, backgroundColor, darkerBackgroundColor],
          )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(flex:1),
                MyDiv(),
                MyText(
                  text: 'addtask'.tr(),
                  size: kTitleSize,
                  softWrap: true,
                ),
                MyDiv(),
                Spacer(flex: 5,),
                TaskNameBox(controller: _controller),
                Spacer(flex: 1,),
                MyDiv(),
                PickDateBox(
                    text: 'start'.tr(),
                    onTap: () async {
                      TimeOfDay time = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      setState(() {
                        startTime = time;
                      });
                    },
                    date: startTime != null ? startTime.format(context) : "--:--"),
                PickDateBox(
                    text: 'end'.tr(),
                    onTap: () async {
                      TimeOfDay time = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      setState(() {
                        endTime = time;
                      });
                    },
                    date: endTime != null ? endTime.format(context) : "--:--"),
                MyDiv(),
                Spacer(flex: 5,),
                MyDiv(),
                AddCancelButtons(
                  addTask: () {
                    TaskHandler.addTask(startTime, endTime, _controller.value.text, Provider.of<TaskProvider>(context, listen: false));
                    Navigator.pop(context);
                  },
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
