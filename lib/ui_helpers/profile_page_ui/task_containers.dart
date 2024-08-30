import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/font_sizes.dart';

class TaskContainer extends StatelessWidget {
  final String text;
  final Color? color;
  final IconData? icon;

  const TaskContainer({
    super.key,
    required this.text,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: color,
            ),
            child:  Icon(
              icon,
              color: Colors.white,
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
             text,
              style: small,
            ),
          )
        ],
      ),
    );
  }
}
