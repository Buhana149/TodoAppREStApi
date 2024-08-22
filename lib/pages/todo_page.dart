import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_restapi/model/todo.dart';
import 'package:todoapp_restapi/provider/todo_provider.dart';
import 'package:http/http.dart' as http;
import 'package:todoapp_restapi/utils/edit_dialog_page.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Provider.of<TodoProvider>(context, listen: false).getAllTodos();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (context, value, child) {
      if (value.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      final todos = value.todos;

      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'To Do List',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 700,
              child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return ToDoListTile(
                      todo: todo,
                      context: context,
                      callback: () async {
                        await value.getAllTodos();
                      },
                    );
                  }),
            )
          ]);
    });
  }
}

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
      builder: (context) =>  Dialog(

        child: EditDialogPage(todo: todo,)));
  }

  Future<void> deleteById(String id) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      callback();
    } else {
      throw 'Somethng went wrong';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, value, child) {
      return ListTile(
          leading: Checkbox(
              value: todo.is_completed,
              onChanged: (newBool) {
                todo.is_completed == newBool;
              }),
          subtitle: Text(todo.description),
          title: Text(todo.title),
          trailing: PopupMenuButton(onSelected: (value) {
            if (value == 'edit') {
              openEditPage();
            } else if (value == 'delete') {
              //delete and remove the item
              deleteById(todo.id);
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
          }));
    });
  }
}
