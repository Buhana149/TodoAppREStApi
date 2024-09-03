import 'package:hive/hive.dart';
import 'package:todoapp_restapi/model/todo.dart';

class TodoDatabase {
  TodoDatabase() {
    _init();
  }

  Box<Todo>? box;

  Future<void> _init() async {
    if (!Hive.isBoxOpen('todos_box')) {
      box = await Hive.openBox<Todo>('todos_box');
    } else {
      box = Hive.box<Todo>('todos_box');
    }
  }

  Future<List<Todo>> getAllTodosFromDatabase() async {
    await _init();
    final list = box?.values.toList();
    if (list != null && list.isNotEmpty) {
      return list;
    } else {
      return <Todo>[];
    }
  }

  Future<void> addTodoToDatabase(Todo todo) async {
    await _init();
    await box?.put(todo.id, todo);
  }

  Future<void> deleteFromDatabase(Todo todo) async {
    await _init();
    await box?.delete(todo);
  }

}
