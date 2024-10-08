import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 400,
        height: 50,
        decoration: BoxDecoration(
            color:secondaryColor,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
