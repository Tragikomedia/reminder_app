import 'package:flutter/cupertino.dart';

class Task {
  String name;
  DateTime start;
  DateTime end;
  Duration duration;
  int number;

  Task({@required this.name, @required this.start, @required this.end, @required this.number}):
  duration = end.difference(start);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name' : name,
      'number' : number,
      'start' : start.toString(),
      'end' : end.toString(),
    };
    return map;
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      name: map['name'].toString(),
      number: map['number'],
      start: DateTime.parse(map['start']),
      end: DateTime.parse(map['end'])
    );
  }

  Duration getDuration(DateTime now) {
    return now.isAfter(start) ? end.difference(now) : end.difference(start);
  }

  Duration getTimeToStart(DateTime now) {
    return start.isAfter(now) ? start.difference(now) : Duration(seconds: 0);
  }

}