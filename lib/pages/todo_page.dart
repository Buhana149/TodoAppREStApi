import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_restapi/components/colors.dart';
import 'package:todoapp_restapi/provider/todo_provider.dart';

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

  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (context, value, child) {
      if (value.isLoading) {
        return Center(child: CircularProgressIndicator());
      }
      final todos = value.todos;
      return Column (
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('To Do List',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
          ),
          Container(
            height: 700,
            child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return ListTile(
                    title: Text(todo.title),
                    leading: Text(todo.description),
                    trailing: Checkbox(
                        value: todo.is_completed,
                        onChanged: (newBool) {
                          todo.is_completed == newBool;
                        }),
                  );
                }),
          )
              
              ]);
    });
  }
}
