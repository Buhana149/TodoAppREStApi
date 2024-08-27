import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_restapi/model/todo.dart';
import 'package:todoapp_restapi/provider/todo_provider.dart';

class LeadingCheckBox extends StatefulWidget {
  final Todo todo;

  const LeadingCheckBox({
    super.key,
    required this.todo,
  });

  @override
  State<LeadingCheckBox> createState() => _LeadingCheckBoxState();
}

class _LeadingCheckBoxState extends State<LeadingCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (context, value, child) {
       return  Checkbox(
        value: widget.todo.is_completed,
        onChanged: (bool? newValue) async {
          
          if (newValue != null) {
            widget.todo.is_completed = newValue;

            value.updateTodoCompletionStatus(widget.todo);
          }
        });
    });
  }
}
