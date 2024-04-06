import "package:flutter/material.dart";
import "package:todo_app/model/todo.dart";

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: todo.isDone ? Colors.blue : null,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: () {},
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.white,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
              decorationColor: Colors.white,
              decorationThickness: 2),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            onPressed: () {
              print("Hello");
            },
            color: const Color.fromARGB(255, 248, 126, 117),
            iconSize: 25,
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
