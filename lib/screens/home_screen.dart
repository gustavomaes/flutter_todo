import 'package:flutter/material.dart';
import 'package:todo_list/widgets/add_task.dart';
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
  final _controller = TextEditingController();
  List<ToDo> todoList = [
    ToDo(name: 'task 1', isCompleted: false),
    ToDo(name: 'task 2', isCompleted: true),
    ToDo(name: 'task 3', isCompleted: true),
    ToDo(name: 'task 4', isCompleted: false),
  ];

  void onChange(bool? value, int index) {
    setState(() {
      todoList[index].isCompleted = !todoList[index].isCompleted;
    });
  }

  void onSave() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        todoList.add(ToDo(name: _controller.text, isCompleted: false));
      });
      _controller.text = "";
    }
    Navigator.of(context).pop();
  }

  void onCancel() {
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AddTask(
          controller: _controller,
          onSave: onSave,
          onCancel: onCancel,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: const Text('ToDo App'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
          size: 32,
        ),
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
