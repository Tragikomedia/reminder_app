import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reminder_app/widgets/my_text.dart';
import 'package:reminder_app/models/task.dart';
import 'package:reminder_app/handlers/shown_time_handler.dart';
import 'package:easy_localization/easy_localization.dart';

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
            ShownTimeHandler.convertTickToText(_timeInSec, timer.tick);
      });
    });
    _generalTimer = Timer(_duration, () {
      setState(() {
        _isDone = true;
      });
      _updatingTimer.cancel();
    });
  }

  _prepareTimers() {
    DateTime now = DateTime.now();
    _duration = widget.task.getDuration(now);
    _timeInSec = _duration.inSeconds;
    _timeToBeShown = ShownTimeHandler.convertTickToText(_timeInSec, 0);
    if (_generalTimer == null) {
      _timerToStart = Timer(widget.task.getTimeToStart(now), _startActualTimers);
    }
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
    return MyText(text: _isDone ? "done".tr() : _timeToBeShown, size: 40);
  }
}
