class Todo {
  final int id;
  final int userId;
  final String title;
   bool isCompleted;

  Todo(
      {required this.id,
      required this.userId,
      required this.title,
      required this.isCompleted});
}
