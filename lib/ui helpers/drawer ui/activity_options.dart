import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/font_sizes.dart';

class ActivityOptions extends StatelessWidget {
  const ActivityOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.local_activity,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Activity',
                    style: small,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.stacked_bar_chart_outlined,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Status',
                    style: small,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.pie_chart,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Statistics',
                    style: small,
                  )
                ],
              ),
            ),
      ],
    );
  }
}