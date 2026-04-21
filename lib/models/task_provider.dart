import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:solo_tu/models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task (name: 'My to do list'),
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }
   int get taskCount {
    return _tasks.length;
   }
   void addTask(String newTaskTile){
    final task = Task (name: newTaskTile);
    _tasks.add(task);
    notifyListeners();
   }
   void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
   }
   void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
   }}