import 'package:flutter/material.dart';

class MyTools extends StatefulWidget {
  const MyTools({super.key});

  @override
  State<MyTools> createState() => _MyToolsState();
}

class _MyToolsState extends State<MyTools> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("My Tools"),
      ),
    );
  }
}
