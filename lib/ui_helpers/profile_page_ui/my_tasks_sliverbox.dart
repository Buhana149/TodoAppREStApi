import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/colors.dart';
import 'package:todoapp_restapi/components/font_sizes.dart';
import 'package:todoapp_restapi/ui_helpers/profile_page_ui/my_tasks.dart';


class MyTasksSliverbox extends StatelessWidget {
  const MyTasksSliverbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'My Tasks',
                  style: medium,
                ),
                const SizedBox(
                  width: 200,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration:
                      BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: secondaryColor,),
                  child: const Icon(Icons.calendar_today,
                  color: Colors.white,),
                ),
                
              ],
            ),
            const MyTasks(),
          ],
        ),
      ),
    );
  }
}
