// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todoapp_restapi/components/button.dart';
// import 'package:todoapp_restapi/components/colors.dart';
// import 'package:todoapp_restapi/model/todo.dart';
// import 'package:todoapp_restapi/provider/todo_provider.dart';

// class EditDialog extends StatefulWidget {
//   const EditDialog({super.key});

//   @override
//   State<EditDialog> createState() => _EditDialogState();
// }

// class _EditDialogState extends State<EditDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TodoProvider>(builder: (context, value, child) {
//       TextEditingController categoryController = TextEditingController();
//       TextEditingController descriptionController = TextEditingController();
      

//       void showSuccessMessage(String message) {
//         final snackBar = SnackBar(content: Text(message));
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       }

//       void showErrorMessage(String message) {
//         final snackBar = SnackBar(
//             content: Text(
//               message,
//               style: const TextStyle(color: Colors.white),
//             ),
//             backgroundColor: Colors.red);
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       }

//       Future<void> editData(id) async {
// //get data from form
//         final category = categoryController.text;
//         final description = descriptionController.text;
//         final body = {
//           "title": category,
//           "description": description,
//           "is_completed": false,
//         };
// //submit data to the server
//         final id = todo['_id'];
//         final url = 'https://api.nstack.in/v1/todos/$id';
//         final uri = Uri.parse(url);
//         final response = await http.post(uri,
//             body: jsonEncode(body),
//             headers: {'Content-Type': 'application/json'});
// //show success or fail message based on status
//         if (response.statusCode == 201) {
//           categoryController.text = '';
//           descriptionController.text = '';
//           showSuccessMessage('Creation Success');
//         } else {
//           showErrorMessage('Creation Failed');
//         }
//         Navigator.pop(context);
//       }

//       return Scaffold(
//         backgroundColor: primaryColor,
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'New objective',
//                     style: TextStyle(fontSize: 25),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: TextField(
//                       controller: categoryController,
//                       decoration: const InputDecoration(hintText: 'Category'),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: TextField(
//                       controller: descriptionController,
//                       decoration:
//                           const InputDecoration(hintText: 'Description'),
//                     ),
//                   ),
//                 ],
//               ),
//               GestureDetector(
//                 onTap: editData,
//                 child: const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: MyButton(text: 'Edit'),
//                 ),
//               )
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
