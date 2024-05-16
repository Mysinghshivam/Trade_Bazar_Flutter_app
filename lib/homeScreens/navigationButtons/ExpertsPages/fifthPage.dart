import 'package:flutter/material.dart';

class fifthExpet extends StatefulWidget {
  const fifthExpet({super.key});

  @override
  State<fifthExpet> createState() => _fifthExpetState();
}

class _fifthExpetState extends State<fifthExpet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Singh Profile"),
      ),
      body: Center(
        child: Text("Hero", style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
