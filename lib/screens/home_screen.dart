import 'package:flutter/material.dart';
import 'package:todo_list/widgets/todo_tile.dart';

class ToDo {
  String name;
  bool isCompleted;

  ToDo({required this.name, required this.isCompleted});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onChange(bool? value, int index) {
    setState(() {
      todoList[index].isCompleted = !todoList[index].isCompleted;
    });
  }

  List<ToDo> todoList = [
    ToDo(name: 'task 1', isCompleted: false),
    ToDo(name: 'task 2', isCompleted: true),
    ToDo(name: 'task 3', isCompleted: true),
    ToDo(name: 'task 4', isCompleted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: const Text('ToDo App'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) => ToDoTile(
            taskName: todoList[index].name,
            isCompleted: todoList[index].isCompleted,
            onChange: (value) => onChange(value, index)),
      ),
    );
  }
}
