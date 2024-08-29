import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/colors.dart';
import 'package:todoapp_restapi/components/font_sizes.dart';
import 'package:todoapp_restapi/ui%20helpers/profile%20page%20ui/my_tasks.dart';

// rename this so it is more meaningful, based on it;s purpose maybe
class SliverBox1 extends StatelessWidget {
  const SliverBox1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
