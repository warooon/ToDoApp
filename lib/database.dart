import 'package:hive/hive.dart';

class database {
  List todo = [];

  final _box = Hive.box('box');

  void createInitialData() {
    todo = [
      ["Enter Data", false],
      ["Enable the checkbox once you complete a task!", false],
      ["Slide left to delete a task!", false],
    ];
  }

  void loadData() {
    todo = _box.get("TODOLIST");
  }

  void updateData() {
    _box.put("TODOLIST", todo);
  }
}
