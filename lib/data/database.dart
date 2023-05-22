import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/models/todo.dart';

class ToDoDatabase {
  List todoList = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    todoList = [ToDo(name: "Task", isCompleted: false)];
  }

  // load the data from database
  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", todoList);
  }
}
