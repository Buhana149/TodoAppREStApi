import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/button.dart';
import 'package:todoapp_restapi/components/colors.dart';
import 'package:todoapp_restapi/model/todo.dart';
import 'package:todoapp_restapi/provider/todo_provider.dart';

class EditDialogPage extends StatefulWidget {
  final Todo todo;
  final VoidCallback onUpdate;

  const EditDialogPage({
    super.key,
    required this.todo,
    required this.onUpdate,
  });

  @override
  State<EditDialogPage> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialogPage> {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _categoryController.text = widget.todo.title;
    _descriptionController.text = widget.todo.description;
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
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: _editData,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: MyButton(text: 'Edit'),
              ),
            )
          ],
        ),
      ),
    );
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
    final todoProvider = TodoProvider();

    await todoProvider.editDataProvider(
      _categoryController.text,
      _descriptionController.text,
      widget.todo,
    );

    if (!todoProvider.isLoading) {
      if (todoProvider.todos.contains(todoProvider.todos.last)) {
        _categoryController.clear();
        _descriptionController.clear();
        _showMessage('Successfully Edited');
        widget.onUpdate();
        Navigator.pop(context);
      } else {
        _showMessage('Failed to Edit');
      }
    }
  }
}
