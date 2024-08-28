import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todoapp_restapi/model/todo.dart';
import 'package:todoapp_restapi/pages/todo_list_tile.dart';

class TodoServices {
  final VoidCallback callback;

  TodoServices({required this.callback});
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

  // delete

  Future<void> deleteById(String id) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      callback();
    } else {
      throw 'Something went wrong';
    }
    
  }
  // put

  Future<void> updateTodoCompletionStatus(Todo todo) async {
    final url = 'https://api.nstack.in/v1/todos/${todo.id}'; // aici e buba
    final uri = Uri.parse(url);
    final body = jsonEncode({
      'title': todo.title,
      'description': todo.description,
      'is_completed': todo.is_completed
    });

    try {
      final response = await http.put(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      if (response.statusCode == 200) {
      } else {
        throw 'Something went wrong - ${response.statusCode}';
      }
    } catch (e) {
      print('Error: $e ');
    }
    
  }
}
