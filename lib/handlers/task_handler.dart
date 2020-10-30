import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/models/task.dart';
import 'package:reminder_app/provider/task_provider.dart';

abstract class TaskHandler {
  static void addTask(TimeOfDay startTime, TimeOfDay endTime, String taskName, var provider) {
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
      else if (now.difference(start).compareTo(Duration(seconds: 59)) >= 0 &&
          now.minute == start.minute &&
          now.hour == start.hour) {
        start = start.add(now.difference(start));
      }
      while (start.isAfter(end)) {
        end = end.add(Duration(days: 1));
      }

      int number = provider.getNumber();
      provider.addTask(Task(
          number: number,
          name: taskName,
          start: start,
          end: end));
    } else {
      throw Error();
    }
  }
}