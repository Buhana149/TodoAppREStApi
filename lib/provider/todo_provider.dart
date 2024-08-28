import 'package:flutter/material.dart';
import 'package:todoapp_restapi/model/todo.dart';
import 'package:todoapp_restapi/services/todo_services.dart';

class TodoProvider extends ChangeNotifier {
  final _service = TodoServices(
    callback: () {},
  );
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

  Future<void> deleteByIdProvider(String id) async {
    screenIsLoading(true);
    try {
      await _service.deleteById(id);
      _todos.removeWhere((todo) => todo.id == id);
      notifyListeners();
    } catch (e) {
      print("Error deleting todo: $e");
    } finally {
      screenIsLoading(false);
    }
    notifyListeners();
  }

  Future<void> updateTodoCompletionStatusProvider(Todo todo) async {
    try {
      await _service.updateTodoCompletionStatus(todo);
      final index = _todos.indexWhere((t) => t.id == todo.id);
      if (index != -1) {
        _todos[index] = todo;
        notifyListeners();
      }
    } catch (e) {
      print('Error updating todo completion status: $e');
    }
    notifyListeners();
  }
}
