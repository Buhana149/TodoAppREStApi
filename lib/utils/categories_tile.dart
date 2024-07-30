import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/colors.dart';

class CategoriesTile extends StatelessWidget {
  final String child;
  final IconData icon;
  const CategoriesTile({super.key, required this.icon, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 120,
        height: 70,
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(40)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon),
        ),
        Text(child,
          style: const TextStyle(color: Colors.white),
        ),
                   
                  ],
                ),
      ),
    );
  }
}
