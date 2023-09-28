import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/dialogueBox.dart';
import 'package:todo_app/todo_tile.dart';
import 'database.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final _box = Hive.box('box');

  database db = database();

  void initState() {
    super.initState();
    if (_box.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  final _controller = TextEditingController();

  void checkBoxState(bool? value, int index) {
    setState(() {
      db.todo[index][1] = !db.todo[index][1];
    });
    db.updateData();
  }

  void saveTask() {
    setState(() {
      db.todo.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return dialogBox(
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSave: saveTask,
          );
        });
  }

  void delete(int index) {
    setState(() {
      db.todo.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Center(
          child: Text(
            "TO DO",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todo.length,
        itemBuilder: ((context, index) {
          return toDoTile(
            taskName: db.todo[index][0],
            taskCompleted: db.todo[index][1],
            onChanged: (value) => checkBoxState(value, index),
            deleteTask: (context) => delete(index),
          );
        }),
      ),
    );
  }
}
