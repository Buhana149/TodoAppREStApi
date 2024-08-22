import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:todoapp_restapi/components/button.dart';
import 'package:todoapp_restapi/components/colors.dart';
import 'package:todoapp_restapi/model/todo.dart';
import 'package:todoapp_restapi/provider/todo_provider.dart';

class EditDialogPage extends StatefulWidget {
  final Todo todo; // Pass the todo item to be edited

  const EditDialogPage({super.key, required this.todo});

  @override
  State<EditDialogPage> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialogPage> {
  late TextEditingController _categoryController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with the current values of the todo
    _categoryController = TextEditingController(text: widget.todo.title);
    _descriptionController = TextEditingController(text: widget.todo.description);
  }

  @override
  void dispose() {
    _categoryController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _showMessage(String message, {Color color = Colors.black}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _editData() async {
    // Get data from form
    final category = _categoryController.text;
    final description = _descriptionController.text;

    if (category.isEmpty || description.isEmpty) {
      _showMessage('Please fill all fields', color: Colors.red);
      return;
    }

    final body = {
      "title": category,
      "description": description,
      "is_completed": widget.todo.is_completed,
    };

    final url = 'https://api.nstack.in/v1/todos/${widget.todo.id}';
    final uri = Uri.parse(url);

    try {
      final response = await http.put(
        uri,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        _showMessage('Update Success', color: Colors.green);
        Provider.of<TodoProvider>(context, listen: false).updateTodo(
          widget.todo.id,
          category,
          description,
          widget.todo.is_completed,
        );
        Navigator.pop(context); // Close the dialog
      } else {
        _showMessage('Update Failed', color: Colors.red);
      }
    } catch (e) {
      _showMessage('An error occurred', color: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Edit objective',
                  style: TextStyle(fontSize: 25),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _categoryController,
                    decoration: const InputDecoration(hintText: 'Category'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _descriptionController,
                    decoration:
                        const InputDecoration(hintText: 'Description'),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: _editData,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: MyButton(
                  text: 'Edit'
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}