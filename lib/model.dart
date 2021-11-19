import 'package:flutter/material.dart';

class Task {
  String todo;
  bool isDone;

  Task({required this.todo, this.isDone = false});

  void ifDone(item) {
    isDone = !isDone;
  }
}

class MyState extends ChangeNotifier {
  List<Task> _list = [];
  String _filterBy = "all";
  String get filterBy => _filterBy;
  List<Task> get list => _list;

  void addTask(Task item) {
    _list.add(item);
    notifyListeners();
  }

  void removeTask(Task item) {
    _list.remove(item);
    notifyListeners();
  }

  void changeIsDone(Task item) {
    item.ifDone(item);
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }
}
