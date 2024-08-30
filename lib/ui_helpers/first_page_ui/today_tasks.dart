import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/font_sizes.dart';

class TodayTasks extends StatelessWidget {
  const TodayTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Tasks for today',
                      style: small,
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    Row(
                      children: [
                        Text('View All'),
                        Icon(Icons.keyboard_arrow_right_outlined)
                      ],
                    ),
                  ],
                ),
              );
  }
}