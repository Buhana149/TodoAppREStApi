import 'package:flutter/material.dart';
import 'package:todoapp_restapi/model/todo.dart';
import 'package:todoapp_restapi/services/todo_services.dart';

class TodoProvider extends ChangeNotifier {
  final _service = TodoServices();
  bool isLoading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _todos = response;
    isLoading = false;
    notifyListeners();
  }
   void updateTodo(String id, String title, String description, bool isCompleted) {
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

}
