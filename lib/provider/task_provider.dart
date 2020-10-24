import 'package:flutter/cupertino.dart';
import 'package:reminder_app/models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _taskList = [
    Task(
        name: 'I cóż, że ze Szwecji Litwini wracają',
        number: 0,
        start: DateTime(2020, 10, 24, 10, 10),
        end: DateTime(2020, 10, 24, 12, 50)),
    Task(
        name: 'Lel',
        number: 1,
        start: DateTime(2020, 10, 24, 18, 2),
        end: DateTime(2020, 10, 24, 19, 50, 24)),
  ];


  int get listLength {
    return _taskList.length;
  }

  Task getTask(int index) {
    return _taskList[index];
  }

  void removeTask(Task task) {
    _taskList.remove(task);
    notifyListeners();
  }

  void removeAllTasks() {
    _taskList.clear();
    notifyListeners();
  }

  void addTask(Task task) {
    _taskList.add(task);
    notifyListeners();
  }
}