import 'package:flutter/material.dart';

class MyTask extends StatefulWidget {
  const MyTask({super.key});

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("My Task"),),
    );
  }
}