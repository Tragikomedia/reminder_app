import 'package:flutter/cupertino.dart';

class Task {
  String name;
  DateTime start;
  DateTime now;
  DateTime end;
  Duration duration;
  int number;

  Task({@required this.name, @required this.start, @required this.end, @required this.number}):
  duration = end.difference(start),
  now = DateTime.now();

  Duration getDuration() {
    return start.difference(now).isNegative ? end.difference(now) : duration;
  }

  Duration getTimeToStart() {
    Duration toStart = start.difference(now);
    return toStart.isNegative ? Duration(microseconds: 0) : toStart;
  }

  int getTimeInSec() {
    return start.difference(now).isNegative ? end.difference(now).inSeconds :duration.inSeconds;
  }

}