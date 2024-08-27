import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/button.dart';
import 'package:todoapp_restapi/components/colors.dart';
import 'package:http/http.dart' as http;

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController categoryController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    void showSuccessMessage(String message) {
      final snackBar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    void showErrorMessage(String message) {
      final snackBar = SnackBar(
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    Future<void> submitData() async {
//get data from form
      final category = categoryController.text;
      final description = descriptionController.text;
      final body = {
        "title": category,
        "description": description,
        "is_completed": false,
      };
//submit data to the server
      const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
      final uri = Uri.parse(url);
      final response = await http.post(uri,
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'});
//show success or fail message based on status
      if (response.statusCode == 201) {
        categoryController.text = '';
        descriptionController.text = '';
        showSuccessMessage('Creation Success');
      } else {
        showErrorMessage('Creation Failed');
      }
    }

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SafeArea(
              child: Text(
                'Add Page',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Image.asset('lib/images/onjectives.jpg'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'New objective',
                  style: TextStyle(fontSize: 25),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: categoryController,
                    decoration: const InputDecoration(hintText: 'Category'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: submitData,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: MyButton(text: 'Add now!'),
            ),
          )
        ],
      ),
    );
  }
}
