import 'package:flutter/material.dart';
import 'package:todo/components/task_tile.dart';
import 'package:todo/models/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> taskList;
  TaskList({this.taskList});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: widget.taskList[index].name,
          isChecked: widget.taskList[index].isDone,
          checkBoxCallback: (checkBoxState) {
            setState(() {
              widget.taskList[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.taskList.length,
    );
  }
}
