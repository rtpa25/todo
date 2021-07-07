import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
  AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String newTask;
    return Container(
      color: Colors.black,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white12,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
          child: Column(
            children: [
              Text(
                'Add Task',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                ),
              ),
              TextField(
                onChanged: (newValue) {
                  newTask = newValue;
                },
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                color: Color(0xFFEB1555),
                minWidth: double.infinity,
                height: 48,
                onPressed: () {
                  addTaskCallback(newTask);
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
