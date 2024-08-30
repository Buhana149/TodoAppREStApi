class Todo {
  final String id;
  final String title;
  final String description;
  // ignore: non_constant_identifier_names
  bool is_completed;

  Todo(
      {required this.id,
        required this.description,
      required this.title,
      // ignore: non_constant_identifier_names
      required this.is_completed});
}
