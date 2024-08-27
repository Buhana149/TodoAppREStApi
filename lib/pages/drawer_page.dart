import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/colors.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SafeArea(
              child: Text(
                'Options',
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const CircleAvatar(
              radius: 40,
              child: Icon(
                Icons.person,
                size: 30,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Gigel Gigelescu',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: secondaryColor,
              ),
              width: 200,
              height: 40,
              child: const Center(
                child: Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
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
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.stacked_bar_chart_outlined,
                  color: Colors.grey,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Status',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.pie_chart,
                  color: Colors.grey,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Statistics',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 230,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.settings,
                  color: Colors.grey,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.power_settings_new_outlined,
                  color: Colors.grey,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
