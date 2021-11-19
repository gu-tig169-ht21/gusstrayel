// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';
import './tasklist.dart';
import './MainView.dart';


class SecondView extends StatelessWidget {
  SecondView({Key? key}): super(key: key);

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
              Provider.of<MyState>(context, listen: false).setFilterBy(value);
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
        builder: (context, state, child) =>
            TaskList(_filterList(state.list, state.filterBy)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainView()));
              // Kommer till MainView där man kan lägga till nya tasks
        },
      ),
    );
  }
}

List<Task> _filterList(list, filterBy) {
  if (filterBy == "all") {
    return list;
  }
  if (filterBy == "done") {
    return list.where((item) => item.isDone == true).toList();
  }
  if (filterBy == "undone") {
    return list.where((item) => item.isDone == false).toList();
  }
  return [];
}
