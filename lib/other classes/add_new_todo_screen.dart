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
  final TextEditingController _descriptionTEController =
      TextEditingController();

  void showAlertDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(
          'WARNING...!',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),

        content: Text('Please enter your to-do task.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          ),
        ],
      ),
    );
  }

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
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: _descriptionTEController,
              decoration: InputDecoration(
                hintText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                fixedSize: Size(150, 50),
              ),

              onPressed: () {
                final title = _titleTEController.text.trim();
                final description = _titleTEController.text.trim();
                if (title.isEmpty && description.isEmpty) {
                  showAlertDialog();
                  return;
                }

                Todo todo = Todo(
                  id: 1,
                  title: _titleTEController.text.trim(),
                  description: _descriptionTEController.text.trim(),
                  status: 'Pending',
                  createDate: DateTime.now(),
                );
                Navigator.pop(context, todo);
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
