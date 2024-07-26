import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/colors.dart';

class CategoriesTile extends StatelessWidget {
  final String child;
  final IconData icon;
  const CategoriesTile({super.key, required this.icon, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Row(
          children: [
            Icon(icon),
            Text(child,
              style: const TextStyle(color: Colors.white),
            ),
           
          ],
        )),
      ),
    );
  }
}
