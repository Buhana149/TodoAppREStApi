import 'package:flutter/material.dart';
import 'package:todoapp_restapi/ui_helpers/profile_page_ui/task_containers.dart';

class MyTasks extends StatelessWidget {
  const MyTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TaskContainer(
        text: 'To Do',
        color: Colors.red[300],
        icon: Icons.watch_later,
      ),
      TaskContainer(
        text: 'In Progress',
        color: Colors.yellow[300],
        icon: Icons.paste_rounded,
      ),
      TaskContainer(
        text: 'Done',
        color: Colors.blue[300],
        icon: Icons.done_all,
      ),
    ]);
  }
}
