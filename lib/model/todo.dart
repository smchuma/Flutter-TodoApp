class Todo {
  String? id;
  String? todoText;
  bool isDone;

  Todo({required this.id, required this.todoText, required this.isDone});

  static List<Todo> todoList() {
    return [
      Todo(id: "01", todoText: "Morning Exercise", isDone: true),
      Todo(id: "02", todoText: "Learn Python", isDone: false),
      Todo(id: "03", todoText: "Learn Flutter", isDone: true),
      Todo(id: "04", todoText: "Learn Flutter", isDone: false),
    ];
  }
}
