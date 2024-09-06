import 'package:hive/hive.dart';

part 'todo.g.dart'; 

@HiveType(typeId: 0)
class Todo {

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
   @HiveField(2)
  final String description;
  // ignore: non_constant_identifier_names
   @HiveField(3)
  bool is_completed;

  Todo(
      {required this.id,
        required this.description,
      required this.title,
      // ignore: non_constant_identifier_names
      required this.is_completed});
}
