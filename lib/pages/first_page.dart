import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/colors.dart';
import 'package:todoapp_restapi/pages/todo_page.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      // extract this app bar as well, maybe it 
      appBar: const FirstpageAppbarUi( title: 'CheckBox',),
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
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return const TodoPage();
                    },
                  ))
            ],
          )),
    );
  }
}
