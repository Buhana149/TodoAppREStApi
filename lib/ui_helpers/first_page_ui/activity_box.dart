import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/colors.dart';

class ActivityBox extends StatelessWidget {
  const ActivityBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  height: 150,
                  width: 170,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.type_specimen,
                          color: Colors.white,
                        ),
                        Text(
                          'Due this week',
                          style: white,
                        ),
                        Text(
                          '2 projects',
                          style:
                              TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                height: 150,
                width: 170,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.type_specimen,
                        color: Colors.white,
                      ),
                      Text(
                        'This week\'s Activity',
                        style: white,
                      ),
                      Text(
                        '48 Tasks',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
  }
}