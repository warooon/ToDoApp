import 'package:flutter/material.dart';
import 'package:todo_app/button.dart';
import 'package:todo_app/home.dart';

class dialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  dialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[700],
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button(text: "Save", onPressed: onSave),
                SizedBox(
                  width: 5,
                ),
                button(text: "Back", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
