import "package:flutter/material.dart";
import "package:todo_app/constants/colors.dart";
import "package:todo_app/model/todo.dart";
import "package:todo_app/widgets/TodoItem.dart";

class Home extends StatelessWidget {
  Home({super.key});

  final todoList = Todo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: __buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SearchBox(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30, bottom: 25),
                      child: const Text(
                        "All Todos",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                    for (Todo todo in todoList) TodoItem(todo: todo)
                  ],
                ),
              )
            ],
          ),
        ));
  }

  AppBar __buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "miTodo",
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          Icon(Icons.menu, color: Colors.white),
        ],
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: const TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              hintText: "Search",
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.search,
                  size: 25,
                ),
              ),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 15, minWidth: 25),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
