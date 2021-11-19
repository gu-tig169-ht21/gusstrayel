// ignore_for_file: file_names

import 'package:flutter/material.dart';
import './SecondView.dart';
import 'package:provider/provider.dart';
import './model.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainViewState();
   }
  }

class MainViewState extends State<StatefulWidget> {
  final textController = TextEditingController();
  String inputTask = '';
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
      margin: EdgeInsets.only(left: 16, top: 24),
      child: Text(
        "Create Task",
        style: TextStyle(fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget _nameInput() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(hintText: "Name of task"),
      ),
    );
  }

  Widget _buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(color: Colors.white,
            style: BorderStyle.solid))
          ),
          
          onPressed: () {
            
            setState(() {
              inputTask = textController.text;
              Provider.of<MyState>(context, listen: false).addTask(
                Task(todo: inputTask));
            });
             Navigator.pop(context);
          }, 
          child: Text("Add"),    
        ),
        Container(width: 40),
      ],
    );
  }
}
