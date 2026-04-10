import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Todo List', style: TextStyle(fontWeight: FontWeight.bold)),
      ),

      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          Todo todo = todoList[index];

          return ListTile(
            title: Text(
              todo.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todo.description),
                Text('Created date: ${todo.createDate}'),
              ],
            ),
            trailing: Text(todo.status, style: TextStyle(fontSize: 16)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Todo todo = Todo(
            id: 1,
            title: 'Dummy title',
            description: 'Description',
            status: 'Pending',
            createDate: DateTime.now(),
          );
          todoList.add(todo);
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Todo {
  final int id;
  final String title;
  final String description;
  final String status;
  final DateTime createDate;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createDate,
  });
}
