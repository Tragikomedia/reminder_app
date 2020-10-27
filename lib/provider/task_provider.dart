import 'package:flutter/cupertino.dart';
import 'package:reminder_app/handlers/db_handler.dart';
import 'package:reminder_app/models/task.dart';
import 'package:reminder_app/handlers/notification_handler.dart';
import 'package:workmanager/workmanager.dart';

class TaskProvider extends ChangeNotifier {
  int lastNumber = 0;
  List<Task> _taskList = [];

  int get listLength {
    return _taskList.length;
  }

  Task getTask(int index) {
    return _taskList[index];
  }

  Future<void> init() async {
    await fillTaskList();
    sortTaskList();
    lastNumber = getNumberFromDb();
    return;
  }

  Future<void> fillTaskList() async {
    if (_taskList.isEmpty) {
      List<Map<String, dynamic>> data = await DB.query('tasks');
      data.forEach((map) => _taskList.add(Task.fromMap(map)));
    }
  }

  void sortTaskList() {
    _taskList.sort((a, b) => a.start.compareTo(b.start));
  }

  int getNumberFromDb() {
    if (_taskList.isNotEmpty) {
      return _taskList.reduce((a, b) => a.number > b.number ? a : b).number + 1;
    }
    return 0;
  }

  void removeTask(Task task) {
    DB.delete('tasks', task);
    Workmanager.cancelByTag('${task.name}_${task.number.toString()}');
    _taskList.remove(task);
    notifyListeners();
  }

  void removeAllTasks() {
    DB.clearDB();
    Workmanager.cancelAll();
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
    registerTask(task);
    sortTaskList();
    notifyListeners();
  }
}
