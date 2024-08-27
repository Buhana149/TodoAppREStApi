import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:todoapp_restapi/model/todo.dart';
import 'package:todoapp_restapi/services/todo_services.dart';

class TodoProvider extends ChangeNotifier {
  final _service = TodoServices();
  bool isLoading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  void screenIsLoading(bool isLoadingParam) {
    isLoading = isLoadingParam;
    notifyListeners();
  }

  Future<void> getAllTodos() async {
    screenIsLoading(true);
    final response = await _service.getAll();
    _todos = response;
    screenIsLoading(false);
  }

  void updateTodo(
    String id,
    String title,
    String description,
    bool isCompleted,
  ) {
    print("object updated $isCompleted");

    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index] = Todo(
        id: id,
        title: title,
        description: description,
        is_completed: isCompleted,
      );

      notifyListeners(); // Notify listeners that the state has changed
    }
  }

  Future<void> updateTodoCompletionStatus(Todo todo) async {
    
    final url = 'https://api.nstack.in/v1/todos/${todo.id}'; // aici e buba
    final uri = Uri.parse(url);
    final body = jsonEncode({
      'title': todo.title,
      'description': todo.description,      
      'is_completed': todo.is_completed});

    try {
      final response = await http.put(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      print("error is ${response.body}");
      if (response.statusCode == 200) {
      } else {
        throw 'Something went wrong - ${response.statusCode}';
      }
    } catch (e) {
      print('Error: $e ');
    }
    notifyListeners();

    await getAllTodos();

    notifyListeners();
  }
}
