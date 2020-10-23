import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reminder_app/models/task.dart';
import 'package:reminder_app/utilities/colors.dart';
import 'package:reminder_app/utilities/enums.dart';
import 'package:reminder_app/widgets/discard_button.dart';
import 'package:reminder_app/widgets/my_text.dart';

class TaskTile extends StatefulWidget {
  final Task task;

  TaskTile({@required this.task});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  Duration _duration;
  int _timeInSec;
  bool _isDone = false;
  String _timeToBeShown;
  Timer _timerToStart;
  Timer _generalTimer;
  Timer _updatingTimer;

  _startActualTimers() {
    _updatingTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _timeToBeShown = _convertTickToText(timer.tick);
        });
      }
    });
    _generalTimer = Timer(_duration, () {
      _updatingTimer.cancel();
      setState(() {
        _isDone = true;
      });
    });
  }

  String _getTextFromTime(int time, TimeDiv type) {
    switch (type) {
      case TimeDiv.hour:
        return time == 0 ? "" : time.toString() + ":";
      case TimeDiv.minute:
        return time.toString().padLeft(2, '0') + ":";
      default:
        return time.toString().padLeft(2, '0');
    }
  }

  String _convertTickToText(int counter) {
    int diffInSec = _timeInSec - counter;
    if (diffInSec <= 0) {
      return "Done";
    }
    int hours = diffInSec ~/ 3600;
    diffInSec -= hours * 3600;
    int minutes = diffInSec ~/ 60;
    diffInSec -= minutes * 60;
    int seconds = diffInSec;
    return (_getTextFromTime(hours, TimeDiv.hour) + _getTextFromTime(minutes, TimeDiv.minute) + _getTextFromTime(seconds, TimeDiv.second));
  }

  @override
  void initState() {
    _duration = widget.task.getDuration();
    _timeInSec = widget.task.getTimeInSec();
    _timeToBeShown = _convertTickToText(0);
    _timerToStart = Timer(widget.task.getTimeToStart(), _startActualTimers);
    super.initState();
  }

  @override
  void dispose() {
    _timerToStart?.cancel();
    _updatingTimer?.cancel();
    _generalTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(text: widget.task.name, size: 26, color: primaryColor,),
                  SizedBox(
                    height: 10,
                  ),
                  MyText(text: "START: " + widget.task.start.hour.toString() +
                    ":" + widget.task.start.minute.toString().padLeft(2, '0'), size: 15,),
                  MyText(text: "END: " + widget.task.end.hour.toString() +
                      ":" + widget.task.end.minute.toString().padLeft(2, '0'), size: 15,),
                ],
              ),
            ),
            MyText(text: _timeToBeShown, color: primaryColor, size: 40),
            SizedBox(width: 10,),
            DiscardButton(isDone: _isDone)
          ],
        ),
      ),
    );
  }
}
