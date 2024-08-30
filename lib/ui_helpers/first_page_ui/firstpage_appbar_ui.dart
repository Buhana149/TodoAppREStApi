import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/colors.dart';

class FirstpageAppbarUi extends StatelessWidget  implements PreferredSizeWidget{
  final String title;
  const FirstpageAppbarUi({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: primaryColor,
        title:  Text( title, 
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );
  }

  
}