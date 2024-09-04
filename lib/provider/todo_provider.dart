import 'package:flutter/material.dart';
import 'package:todoapp_restapi/model/todo.dart';
import 'package:todoapp_restapi/services/todo_database.dart';
import 'package:todoapp_restapi/services/todo_services.dart';

class TodoProvider extends ChangeNotifier {
  final _service = TodoServices();
  final _databaseService = TodoDatabase();
  bool isLoading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  TodoProvider() {
    _loadTodosFromHive();
  }

  void screenIsLoading(bool isLoadingParam) {
    isLoading = isLoadingParam;
    notifyListeners();
  }

  Future<void> getAllTodos() async {
    screenIsLoading(true);
    try {
      final response = await _service.getAll();
      _todos = response;

      for (var todo in _todos) {
        await _databaseService.addTodoToDatabase(todo);
      }
    } catch (e) {
      print('Error fetching todos: $e');
    } finally {
      screenIsLoading(false);
    }
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

      notifyListeners();
    }
  }

  Future<void> deleteByIdProvider(id) async {
    screenIsLoading(true);
    try {
      await _service.deleteById(id);
      _todos.removeWhere((todo) => todo.id == id);

      await _databaseService.deleteFromDatabase(id);
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

        await _databaseService.addTodoToDatabase(todo);
        notifyListeners();
      }
    } catch (e) {
      print('Error updating todo completion status: $e');
    }
    notifyListeners();
  }

  Future<void> submitTodoProvider(String category, String description) async {
    try {
      bool isSuccessful = await _service.submitTodo(
        category,
        description,
      );

      if (isSuccessful) {
        await getAllTodos();
      }
    } catch (e) {
      print('Error updating todo completion status: $e');
    }
    notifyListeners();
  }

  Future<void> editDataProvider(
      String category, String description, Todo todo) async {
    try {
      bool isSuccessful = await _service.editData(
        category,
        description,
        todo,
      );

      if (isSuccessful) {
        await getAllTodos();
      }
    } catch (e) {
      print('Error updating todo completion status: $e');
    }

    notifyListeners();
  }

  Future<void> _loadTodosFromHive() async {
    final todosFromDatabase = await _databaseService.getAllTodosFromDatabase();
    _todos = todosFromDatabase;
    notifyListeners();
  }
}
