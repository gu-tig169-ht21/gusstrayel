import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'InternetFetcher.dart';

class Task {
  String id;
  String title;
  bool done;

  Task({required this.id, required this.title, this.done = false});

  void checkBoxChanged(Task todo) {
    done = !done;
  }

  static Map<String, dynamic> toJson(Task todo) {
    return {'id': todo.id, 'title': todo.title, 'done': todo.done};
  }

  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      done: json['done'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<Task> _list = [];
  String _filterBy = 'all';

  List<Task> get list => _list;

  String get filterBy => _filterBy;

  Future getList() async {
    List<Task> list = await InternetFetcher.getTasks();
    _list = list;
    notifyListeners();
  }

  void addTask(Task todo) async {
    _list = await InternetFetcher.addTask(todo);
    notifyListeners();
  }

  void removeTaskItem(Task todo) async {
    _list = await InternetFetcher.deleteTask(todo.id);
    notifyListeners();
  }

  void changeIsDone(Task todo, value) async {
    todo.done = value;
    _list = await InternetFetcher.putTask(todo);
    notifyListeners();
  }

  void setFilterBy(String filterBy) async {
    _filterBy = filterBy;
    notifyListeners();
    
  }
}
