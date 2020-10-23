import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reminder_app/models/task.dart';
import 'package:reminder_app/utilities/colors.dart';

class TaskTile extends StatefulWidget {
  final Task task;

  TaskTile({@required this.task});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  Duration _duration;
  int _timeInSec;
  String _timeToBeShown;
  Timer _timerToStart;
  Timer _updatingTimer;

  _startActualTimers() {
    _updatingTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timeToBeShown = _convertTickToText(timer.tick);
      });
    });
    Timer(_duration, () {
      _updatingTimer.cancel();
    });
  }

  String _convertTickToText(int counter) {
    int diffInSec = _timeInSec - counter;
    int hours = diffInSec ~/ 3600;
    diffInSec -= hours*3600;
    int minutes = diffInSec ~/ 60;
    diffInSec -= minutes*60;
    int seconds = diffInSec;
    return hours.toString() + ":" + minutes.toString() + ":" + seconds.toString();
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
  Widget build(BuildContext context) {
    return ListTile(tileColor: borderColor,
      leading: Text(_timeToBeShown),
    );
  }
}
