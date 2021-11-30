// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';

class TaskList extends StatelessWidget {
  final List<Task> list;
  const TaskList(this.list);


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list.map((todo) => _taskItem(todo, context)).toList(),
    );
  }

  Widget _taskItem(Task todo, BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: todo.done,
          onChanged: (value) {
            Provider.of<MyState>(context, listen: false)
                .changeIsDone(todo, value);
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
            state.removeTaskItem(todo);
          },
        ),
      ),
    );
  }
}
