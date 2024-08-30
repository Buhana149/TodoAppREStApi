import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/font_sizes.dart';

class SettingsOptions extends StatelessWidget {
  const SettingsOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Settings',
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
                Icons.power_settings_new_outlined,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Sign Out',
                style: small,
              )
            ],
          ),
        )
      ],
    );
  }
}
