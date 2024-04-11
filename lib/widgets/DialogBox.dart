import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:todo_app/widgets/Buttons.dart";

class DialogBox extends StatelessWidget {
  final controller;
  final onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 32, 91, 140),
      content: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 0),
                child: TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Add a new Task",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Buttons(text: "Add", onPressed: onSave),
                    Buttons(text: "Cancel", onPressed: onCancel),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
