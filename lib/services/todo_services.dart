import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todoapp_restapi/model/todo.dart';

class TodoServices { 
  Future<List<Todo>> getAll() async {
    const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final items = json["items"] as List;
      final todos = items.map((e) {
        return Todo(
            id: e['_id'],
            title: e['title'],
            description: e['description'],
            is_completed: e['is_completed']);
      }).toList();
      return todos;

      // return List.empty();
    } else {
      throw 'Something went wrong';
    }
  }
}
