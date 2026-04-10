import 'package:flutter/material.dart';
import 'package:todo_application/todo_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: TodoApp(),
    );
  }
}
