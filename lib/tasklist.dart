import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';
import './main.dart';

class TaskList extends StatelessWidget {
  final List<Task> list;

  TaskList(this.list);

  @override
  Widget build(BuildContext) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _taskItem(list[index], context);
        });
  }

  Widget _taskItem(Task item, context) {
    // var text = Text(item.todo, style: TextStyle(color: Colors.white));
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: item.isDone,
          onChanged: (bool? isDone) {
            Provider.of<MyState>(context, listen: false).changeIsDone(item);
          },
        ),
        title: Text(item.todo, style: TextStyle(
          decoration: item.isDone ? TextDecoration.lineThrough : TextDecoration.none
        )),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            Provider.of<MyState>(context, listen: false).removeTask(item);
          },
        ),
      ),
    );
  }
}
