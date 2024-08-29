import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/colors.dart';
import 'package:todoapp_restapi/pages/todo_page.dart';
import 'package:todoapp_restapi/ui%20helpers/first%20page%20ui/activity_box.dart';
import 'package:todoapp_restapi/ui%20helpers/first%20page%20ui/greeting_messages.dart';
import 'package:todoapp_restapi/utils/task_categories.dart';
import 'package:todoapp_restapi/ui%20helpers/first%20page%20ui/today_tasks.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'CheckBox',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
              SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const TodoPage();
                    },
                  ))
            ],
          )),
    );
  }
}
