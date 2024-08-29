import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/font_sizes.dart';

class MyTasks extends StatelessWidget {
  const MyTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.red[300],
                ),
                child: const Icon(
                  Icons.watch_later,
                  color: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'To Do',
                  style: small,
                ),
              )
            ],
          ),
        ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.yellow[300],
                ),
                child: const Icon(
                  Icons.paste_rounded,
                  color: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'In Progress',
                  style: small,
                ),
              )
            ],
                   ),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue[300],
                ),
                child: const Icon(
                  Icons.done_all,
                  color: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Done',
                  style: small,
                ),
              )
            ],
                   ),
         )
      ],
    );
  }
}
