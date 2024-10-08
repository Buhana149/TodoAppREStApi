import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const TextfieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ));
  }
}
