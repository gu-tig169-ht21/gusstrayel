// ignore_for_file: file_names

import 'package:flutter/material.dart';
import './model.dart';

class MainView extends StatefulWidget {
  final Task todo;
  const MainView(this.todo, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MainViewState(todo);
  }
}

class _MainViewState extends State<MainView> {
  late TextEditingController textController;
  late bool done;
  late String title;
  late String empty = '';

  _MainViewState(Task todo) {
    title = todo.title;
    done = todo.done;
    textController = TextEditingController();

    textController.addListener(() {
      setState(() {
        title = textController.text;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TIG169"),
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
      margin: EdgeInsets.only(left: 30, top: 20, bottom: 20, right: 30),
      child: Text(
        "Create Task",
        style: TextStyle(
            fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget _nameInput() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
      child: TextField(
        onTap: () {
          setState(() {
            empty = '';
          });
        },
        controller: textController,
        decoration: InputDecoration(
            hintText: "Name of task", border: OutlineInputBorder()),
      ),
    );
  }

  Widget _buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          style: ButtonStyle(
              side: MaterialStateProperty.all(
                  BorderSide(color: Colors.grey, style: BorderStyle.solid))),
          onPressed: () {
            setState(() {
              title = textController.text;
            });
            Navigator.pop(context, Task(title: title, done: done, id: ''));
          },
          child: Text("Add"),
        ),
        Container(width: 40),
      ],
    );
  }
}
