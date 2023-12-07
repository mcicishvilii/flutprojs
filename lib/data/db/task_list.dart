import 'package:flutprojs/data/db/task_info.dart';
import 'package:flutter/material.dart';

import 'database_helper.dart';

class TaskList extends ChangeNotifier {
  final List<TaskInfo> _tasks = [];
  final dbHelper = DatabaseHelper.instance;

  List<TaskInfo> get tasks => _tasks;

  void add(TaskInfo task) async {
    _tasks.add(task);
    await dbHelper.insertTask(task);
    notifyListeners();
  }

  Future<void> loadTasks() async {
    _tasks.clear();
    final loadedTasks = await dbHelper.tasks();
    _tasks.addAll(loadedTasks);
    notifyListeners();
  }

  Future<void> finishTask(TaskInfo task) async {
    await dbHelper.finishTask(task);
    notifyListeners();
  }

  Future<void> removeTask(TaskInfo task) async {
    _tasks.remove(task);
    await dbHelper.removeTask(task);
    notifyListeners();
  }
}
