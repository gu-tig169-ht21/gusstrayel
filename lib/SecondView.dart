// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import './tasklist.dart';
import 'package:provider/provider.dart';
import './model.dart';
import './MainView.dart';

class SecondView extends StatefulWidget {
  const SecondView({Key? key}) : super(key: key);
  @override
  _SecondViewState createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  List<Task> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do list"),
        centerTitle: true,
        elevation: 0,
        actions: [
          PopupMenuButton(
            onSelected: (String value) {
              Provider.of<MyState>(context, listen: false).setFilterList(value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("All"),
                value: ("all"),
              ),
              PopupMenuItem(
                child: Text("Done"),
                value: ("done"),
              ),
              PopupMenuItem(child: Text("Undone"), value: "undone")
            ],
          ),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => TaskList(
          _filteredList(state.list, state.filterBy),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            var newTodo = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainView(Task(title: '', done: false)),
              ),
            );
          }),
    );
  }

  List<Task> _filteredList(list, filterBy) {
    if (filterBy == "all") {
      return list;
    }
    if (filterBy == "done") {
      return list.where((todo) => todo.done == true).toList();
    }
    if (filterBy == "undone") {
      return list.where((todo) => todo.done == false).toList();
    }
    return list;
  }
}
