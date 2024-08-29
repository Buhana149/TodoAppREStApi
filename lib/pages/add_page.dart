import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_restapi/components/button.dart';
import 'package:todoapp_restapi/components/colors.dart';
import 'package:todoapp_restapi/components/font_sizes.dart';
import 'package:todoapp_restapi/provider/todo_provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Consumer<TodoProvider>(builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SafeArea(
                child: Text(
                  'Add Page',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Image.asset('lib/images/onjectives.jpg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New objective',
                    style: small,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: categoryController,
                      decoration: const InputDecoration(hintText: 'Category'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: descriptionController,
                      decoration:
                          const InputDecoration(hintText: 'Description'),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap:() async {
                await submitTodo(value);
              },
               child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: MyButton(text: 'Add now!'),
              ),
            )
          ],
        );
      }),
    );
  }

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMessage(String message) {
    final snackBar = SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> submitTodo(TodoProvider todoProvider) async {

    await todoProvider.submitTodoProvider(
      categoryController.text,
      descriptionController.text,
    );

    if (!todoProvider.isLoading) {
       if (todoProvider.todos.contains(todoProvider.todos.last)) {
        categoryController.clear();
        descriptionController.clear();
        showSuccessMessage('Creation Success');
    } else {
        showErrorMessage('Creation Failed');
      }
    }
  }
}
