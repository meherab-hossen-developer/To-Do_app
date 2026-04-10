import 'package:flutter/material.dart';
import 'package:todo_application/other%20classes/todo_variable.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddNewTodoScreenState();
  }
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descroptionTEController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add new todo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleTEController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: _descroptionTEController,
              decoration: InputDecoration(hintText: 'Description'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Todo todo = Todo(
                  id: 1,
                  title: _titleTEController.text.trim(),
                  description: _descroptionTEController.text.trim(),
                  status: 'Pending',
                  createDate: DateTime.now(),
                );
                Navigator.pop(context, todo);
              },
              child: Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
