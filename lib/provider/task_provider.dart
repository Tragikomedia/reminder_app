import 'package:flutter/cupertino.dart';
import 'package:reminder_app/handlers/db_handler.dart';
import 'package:reminder_app/models/task.dart';

class TaskProvider extends ChangeNotifier {
  int lastNumber = 0;
  List<Task> _taskList = [];


  int get listLength {
    return _taskList.length;
  }

  Task getTask(int index) {
    return _taskList[index];
  }

  Future<void> fillTaskList() async {
    if (_taskList.isEmpty) {
      List<Map<String, dynamic>> data = await DB.query('tasks');
      data.forEach((map) => _taskList.add(Task.fromMap(map)));
    }
    return;
  }

  void removeTask(Task task) {
    DB.delete('tasks', task);
    _taskList.remove(task);
    notifyListeners();
  }

  void removeAllTasks() {
    DB.clearDB();
    _taskList.clear();
    notifyListeners();
  }

  int getNumber() {
    lastNumber++;
    return lastNumber - 1;
  }

  void addTask(Task task) {
    DB.insert('tasks', task);
    _taskList.add(task);
    notifyListeners();
  }
}