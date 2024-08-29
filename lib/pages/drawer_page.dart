import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/edit_profile_button.dart';
import 'package:todoapp_restapi/components/font_sizes.dart';
import 'package:todoapp_restapi/ui%20helpers/drawer%20ui/activity_options.dart';
import 'package:todoapp_restapi/ui%20helpers/drawer%20ui/profile_drawer.dart';
import 'package:todoapp_restapi/ui%20helpers/drawer%20ui/settings_options.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Text(
                'Options',
                style: medium,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ProfileDrawer(),
            SizedBox(
              height: 20,
            ),
            EditProfileButton(),
            SizedBox(
              height: 20,
            ),
            ActivityOptions(),
            SizedBox(
              height: 230,
            ),
            SettingsOptions(),
          ],
        ),
      ),
    );
  }
}
