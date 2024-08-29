import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_restapi/model/todo.dart';
import 'package:todoapp_restapi/provider/todo_provider.dart';
import 'package:todoapp_restapi/utils/checkbox.dart';
import 'package:todoapp_restapi/utils/edit_dialog_page.dart';

typedef VoidCallback = void Function();

class ToDoListTile extends StatelessWidget {
  final VoidCallback callback;
  final Todo todo;
  final BuildContext context;

  const ToDoListTile({
    super.key,
    required this.todo,
    required this.context,
    required this.callback,
  });

  void openEditPage() {
    showDialog(
        context: context,
        builder: (context) => Dialog(
                child: EditDialogPage(
              onUpdate: () {
                Provider.of<TodoProvider>(context, listen: false).getAllTodos();
              },
              todo: todo,
            ),),);
  }

  void _deleteByIdProvider() async {
    // Access the provider and call the delete method
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    await todoProvider.deleteByIdProvider(todo.id);
  }

  @override
  Widget build(BuildContext context) => Consumer<TodoProvider>(
      builder: (context, value, child) => ListTile(
          leading: LeadingCheckBox(
            todo: todo,
          ),
          subtitle: Text(todo.description),
          title: Text(todo.title),
          trailing: PopupMenuButton(onSelected: (value) {
            if (value == 'edit') {
              openEditPage();
            } else if (value == 'delete') {
              _deleteByIdProvider();
              //delete and remove the item
              //   deleteById(todo.id); use provider instead
            }
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 'edit',
                child: Text('Edit'),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Text('Delete'),
              )
            ];
          })));
}
