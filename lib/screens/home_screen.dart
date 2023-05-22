import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/data/database.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/widgets/add_task.dart';
import 'package:todo_list/widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  final _box = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_box.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void onChange(bool? value, int index) {
    setState(() {
      db.todoList[index].isCompleted = !db.todoList[index].isCompleted;
    });
    db.updateDataBase();
  }

  void onSave() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        db.todoList.add(ToDo(name: _controller.text, isCompleted: false));
      });
      _controller.text = "";
    }
    db.updateDataBase();
    Navigator.of(context).pop();
  }

  void onDelete(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
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
        itemCount: db.todoList.length,
        itemBuilder: (context, index) => ToDoTile(
          taskName: db.todoList[index].name,
          isCompleted: db.todoList[index].isCompleted,
          onChange: (value) => onChange(value, index),
          onDelete: (context) => onDelete(index),
        ),
      ),
    );
  }
}
