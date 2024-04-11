import "package:flutter/material.dart";
import "package:todo_app/constants/colors.dart";
import "package:todo_app/model/todo.dart";
import "package:todo_app/widgets/DialogBox.dart";
import "package:todo_app/widgets/TodoItem.dart";

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = Todo.todoList();
  List<Todo> _foundTodo = [];

  final _controller = TextEditingController();

  @override
  void initState() {
    _foundTodo = todoList;
    super.initState();
  }

  void saveNewTask() {
    setState(() {
      todoList.add(Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: _controller.text,
          isDone: false));
    });
    Navigator.of(context).pop();
    _controller.clear();
  }

  void createNewTask(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: __buildAppBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            createNewTask(context);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: const InputDecoration(
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
              ),
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
                    for (Todo todo in _foundTodo.reversed)
                      TodoItem(
                        todo: todo,
                        onTodoChange: _handleTodoChange,
                        onDeleteItem: _deleteTodoItem,
                      )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _runFilter(String enteredKeyword) {
    List<Todo> results = [];

    if (enteredKeyword.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundTodo = results;
    });
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
