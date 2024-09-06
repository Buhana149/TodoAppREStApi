import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_restapi/components/colors.dart';
import 'package:todoapp_restapi/provider/todo_provider.dart';
import 'package:todoapp_restapi/ui_helpers/first_page_ui/activity_box.dart';
import 'package:todoapp_restapi/ui_helpers/first_page_ui/firstPage_appBar_ui.dart';
import 'package:todoapp_restapi/ui_helpers/first_page_ui/greeting_messages.dart';
import 'package:todoapp_restapi/utils/task_categories.dart';
import 'package:todoapp_restapi/ui_helpers/first_page_ui/today_tasks.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    _fetchTodos();
  }

  void _fetchTodos() async {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);

    await todoProvider.getAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FirstpageAppbarUi(title: 'CheckBox'),
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            const GreetingMessages(),
            const SizedBox(
              height: 20,
            ),
            const TaskCategories(),
            const ActivityBox(),
            const TodayTasks(),
            Consumer<TodoProvider>(
              builder: (context, value, child) {
                final itemCount =
                    value.todos.length >= 2 ? 2 : value.todos.length;
                return SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      final todo = value.todos[index];

                      return ListTile(
                        title: Text(todo.title),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
