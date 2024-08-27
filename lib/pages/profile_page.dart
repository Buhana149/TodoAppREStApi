import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/colors.dart';
import 'package:todoapp_restapi/pages/drawer_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: primaryColor,
      drawer: const DrawerPage(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: secondaryColor,
            title: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Gigel Gigelescu',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Text(
                        'App Developer',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[300],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
}
