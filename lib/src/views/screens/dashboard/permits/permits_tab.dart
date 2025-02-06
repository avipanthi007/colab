import 'package:flutter/material.dart';

class PermitsTab extends StatefulWidget {
  const PermitsTab({super.key});

  @override
  State<PermitsTab> createState() => _PermitsTabState();
}

class _PermitsTabState extends State<PermitsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
      ),
    );
  }
}
