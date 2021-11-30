// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';


class TaskList extends StatelessWidget {
  final List<Task> list;
  TaskList(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list.map((todo) => _taskItem(todo, context)).toList());
  }
   // return Consumer<MyState>(
     // builder: (context, state, child) => _taskList(state.filteredList),
   // );
  }

 // Widget _taskList(_list) {
   // return ListView.builder(
    //  itemCount: _list.length,
   //   itemBuilder: (BuildContext context, int index) {
        // var task = list[index];
    //    return _taskItem(_list[index], context);
    //  },
   // );
//  }

  Widget _taskItem(todo, context) {
    // var text = Text(item.todo, style: TextStyle(color: Colors.white));
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: todo.done,
          onChanged: (bool? newValue) {
            Provider.of<MyState>(context, listen: false)
                .changeIsDone(todo);
          },
        ),
        title: Text(todo.title,
            style: TextStyle(
                decoration: todo.done
                    ? TextDecoration.lineThrough
                    : TextDecoration.none)),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            var state = Provider.of<MyState>(context, listen: false);
                state.removeTaskItem(todo.id);
          },
        ),
       ),
     );
  }

  // void _getTasks() async {
  //  var state = Provider.of<MyState>(context,)
  // }

