import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/colors.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
