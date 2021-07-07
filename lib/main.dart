import 'package:flutter/material.dart';
import 'screens/task_screen.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        accentColor: Color(0xFFEB1555),
      ),
      debugShowCheckedModeBanner: false,
      home: TasksScreen(),
    );
  }
}
