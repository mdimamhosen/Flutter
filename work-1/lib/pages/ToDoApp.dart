import 'package:firstapp/pages/DialougeBox.dart';
import 'package:firstapp/utils/ToDo_tile.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  // text editing controller to get access to what the user typed
  TextEditingController myController = TextEditingController();

  final TextEditingController todoController = TextEditingController();

  String greetingMessage = "";

  void greetUser() {
    setState(() {
      greetingMessage = "Hello ${myController.text}";
    });
  }

  List toDoList = [
    {"taskName": "Clean House", "taskCompleted": false},
    {"taskName": "Do Laundry", "taskCompleted": false},
    {"taskName": "Do Dishes", "taskCompleted": false},
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index] = {
        "taskName": toDoList[index]["taskName"],
        "taskCompleted": !toDoList[index]["taskCompleted"],
      };
    });
  }

  void saveNewTask() {
    if (todoController.text.trim().isEmpty) return;
    setState(() {
      toDoList.add({"taskName": todoController.text, "taskCompleted": false});
    });

    todoController.clear();
    Navigator.of(context).pop();
  }

  void cancelTask() {
    todoController.clear();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) => Dialougebox(
        controller: todoController,
        onSave: saveNewTask,
        onCancel: cancelTask,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: Text("Todo App"),
          centerTitle: true,
          backgroundColor: Colors.yellow[600],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: Colors.yellow[300],
          foregroundColor: Colors.black,
          elevation: 10,
          tooltip: "Add Task",
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(Icons.add),
        ),
        body: Expanded(
          child: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: toDoList[index]["taskName"],
                onChanged: (value) => checkBoxChanged(index),
                taskCompleted: toDoList[index]["taskCompleted"],
              );
            },
          ),
        ),
      ),
    );
  }
}
