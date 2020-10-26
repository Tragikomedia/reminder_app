import 'package:reminder_app/models/task.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

abstract class DB {
  static Database _db;

  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'tasks';
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    } catch (e) {
      print(e);
    }
  }

  static void onCreate(Database db, int version) async => await db.execute(
      'CREATE TABLE tasks (number INTEGER, name STRING, start STRING, end STRING)');

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db.query(table);

  static Future<int> insert(String table, Task task) async =>
      await _db.insert(table, task.toMap());

  static Future<int> update(String table, Task task) async =>
      await _db.update(table, task.toMap(),
          where: 'number = ?', whereArgs: [task.number]);

  static Future<int> delete(String table, Task task) async =>
      await _db.delete(table, where: 'number = ?', whereArgs: [task.number]);
}
