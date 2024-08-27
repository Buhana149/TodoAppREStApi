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
              todo: todo,
            )));
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
//   Future<void> deleteById(String id) async {
//     final url = 'https://api.nstack.in/v1/todos/$id';
//     final uri = Uri.parse(url);
//     final response = await http.delete(uri);
//     if (response.statusCode == 200) {
//       callback();
//     } else {
//       throw 'Somethng went wrong';
//     }
//   }