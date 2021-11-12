// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, must_be_immutable

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TIG169"),
        actions: [
          IconButton(
              icon: Icon(Icons.arrow_right),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondView()));
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 32),
            _nameLabel(),
            _nameInput(),
            _buttonRow(),
            Container(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _nameLabel() {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 24),
      child: Text(
        "Create Task",
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  Widget _nameInput() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        decoration: InputDecoration(hintText: "Name of task"),
      ),
    );
  }

  Widget _buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {},
          child: Text("Add"),
        ),
        Container(width: 40),
      ],
    );
  }
}

class SecondView extends StatelessWidget {
  List<String> tasks = ["Fika", "Sova", "Äta", "Träna", "Baka"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do list"),
        centerTitle: true,
        elevation: 0,
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("All"),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text("Done"),
                      value: 2,
                    ),
                    PopupMenuItem(child: Text("Undone"), value: 3)
                  ])
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            child: _tile(
                Icons.check_box_outline_blank, tasks[index], Icons.delete),
          );
        },
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }

  ListTile _tile(IconData icon, String title, IconData icon2) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
          )),
      leading: Column(
        children: [
          Icon(
            icon,
            color: Colors.blue[500],
            size: 20.0,
          ),
        ],
      ),
      trailing: Column(
        children: [
          Icon(
            icon2,
            color: Colors.blue[500],
            size: 20.0,
          ),
        ],
      ),
    );
  }
}
