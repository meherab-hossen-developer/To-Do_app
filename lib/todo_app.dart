import 'package:flutter/material.dart';
import 'package:todo_application/other%20classes/add_new_todo_screen.dart';

import 'other classes/todo_variable.dart';

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
            onLongPress: (){
              todoList.removeAt(index);
              setState(() {});
            },
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
        onPressed: () async {
          Todo? todo = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddNewTodoScreen();
              },
            ),
          );
          if(todo != null){
            todoList.add(todo);
            setState(() {

            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
