import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/font_sizes.dart';
class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
              radius: 40,
              child: Icon(
                Icons.person,
                size: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Gigel Gigelescu',
                style: small,
              ),
            ),
      ],
    );
  }
}