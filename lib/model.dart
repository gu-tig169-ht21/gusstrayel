import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'InternetFetcher.dart';

class Task {
  String id;
  String title;
  bool done;

  Task({this.id = '', required this.title, this.done = false});

  static Map<String, dynamic> toJson(Task todo) {
    return {'title': todo.title, 'done': todo.done, 'id': todo.id};
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
  List<Task> _filteredList = [];
  List<Task> get list => _list;
  List<Task> get filteredList => _filteredList;

  String get filterBy => _filterBy;

  Future getList() async {
    List<Task> list = await InternetFetcher.getTasks();
    _list = list;
    notifyListeners();
  }

  void addTask(Task title) async {
    _list = await InternetFetcher.addTask(title);
    _filteredList = _list;
    notifyListeners();
  }

  void removeTaskItem(String id) async {
    _list = await InternetFetcher.deleteTask(id);
    _filteredList = _list;
    notifyListeners();
  }

  changeIsDone(Task title) async {
    title.done = !title.done;
    await InternetFetcher.putTask(title);
    notifyListeners();
  }

  void setFilterList(String filterBy) {
    _list = _filteredList;
    notifyListeners();
  }
}
