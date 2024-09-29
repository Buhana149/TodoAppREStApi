import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todoapp_restapi/model/todo.dart';

class TodoServices {
  TodoServices();

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
    } else {
      throw 'Something went wrong';
    }
  }

  Future<bool> deleteById(String id) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return true;
    } else {
      throw Exception('Failed to delete todo: ${response.statusCode}');
    }
  }

  Future<void> updateTodoCompletionStatus(Todo todo) async {
    final url = 'https://api.nstack.in/v1/todos/${todo.id}';
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

  Future<bool> submitTodo(String category, String description) async {
    final body = {
      "title": category,
      "description": description,
      "is_completed": false,
    };

    const url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> editData(String category, String description, Todo todo) async {
    final body = {
      "title": category,
      "description": description,
      "is_completed": todo.is_completed,
    };

    final url = 'https://api.nstack.in/v1/todos/${todo.id}';
    final uri = Uri.parse(url);

    final response = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return true;
    } else {
      return false;
    }
  }
}
