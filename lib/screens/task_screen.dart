import 'package:flutter/material.dart';
import 'package:todo/components/task_list.dart';
import 'package:todo/models/task.dart';
import 'add_task_page.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
          elevation: 18,
          hoverElevation: 30,
          backgroundColor: Color(0xFFEB1555),
          child: Icon(
            Icons.add,
            size: 40,
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.top),
                  child: AddTaskScreen((newTaskTitle) {
                    setState(() {
                      tasks.add(Task(name: newTaskTitle));
                      Navigator.pop(context);
                    });
                  }),
                ),
              ),
            );
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 60, 40, 20),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFEB1555),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.list,
                    size: 60,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Todoey',
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white60,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 8, 0, 40),
              child: Text(
                tasks.length.toString() + ' Tasks',
                style: TextStyle(
                  fontSize: 23,
                  color: Color(0xFFEB1555),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white12,
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(35, 20, 20, 20),
                  child: TaskList(taskList: tasks),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
