import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('box');
  runApp(const todo());
}

class todo extends StatelessWidget {
  const todo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotesApp',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const Main(),
    );
  }
}
