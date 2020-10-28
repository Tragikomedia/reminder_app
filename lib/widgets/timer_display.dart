import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reminder_app/widgets/my_text.dart';
import 'package:reminder_app/models/task.dart';
import 'package:reminder_app/utilities/colors.dart';
import 'package:reminder_app/handlers/shown_time_handler.dart';

class TimerDisplay extends StatefulWidget {
  final UniqueKey key;
  final Task task;

  TimerDisplay({@required this.task, @required this.key});

  @override
  _TimerDisplayState createState() => _TimerDisplayState();
}

class _TimerDisplayState extends State<TimerDisplay> {
  Duration _duration;
  int _timeInSec;
  bool _isDone;
  String _timeToBeShown;
  Timer _timerToStart;
  Timer _generalTimer;
  Timer _updatingTimer;

  _startActualTimers() {
    _updatingTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timeToBeShown =
            ShownTimeHandler.convertTickToText(_isDone, _timeInSec, timer.tick);
      });
    });
    _generalTimer = Timer(_duration, () {
      _updatingTimer.cancel();
      setState(() {
        _isDone = true;
      });
    });
  }

  _prepareTimers() {
    _duration = widget.task.getDuration();
    _timeInSec = widget.task.getTimeInSec();
    _timeToBeShown = ShownTimeHandler.convertTickToText(_isDone, _timeInSec, 0);
    _timerToStart = Timer(widget.task.getTimeToStart(), _startActualTimers);
  }

  _cancelTimers() {
    _timerToStart?.cancel();
    _updatingTimer?.cancel();
    _generalTimer?.cancel();
  }

  @override
  void initState() {
    _isDone = widget.task.end.isBefore(DateTime.now());
    _prepareTimers();
    super.initState();
  }

  @override
  void dispose() {
    _cancelTimers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyText(text: _timeToBeShown, size: 40);
  }
}
