import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'todo.g.dart';

@HiveType(typeId: 1, adapterName: 'ToDoAdapter')
class ToDo {
  @HiveField(0)
  String name;
  @HiveField(1)
  bool isCompleted;

  ToDo({required this.name, required this.isCompleted});
}
