import 'package:flutter/material.dart';
class secondPage extends StatefulWidget {
  const secondPage({super.key});

  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Akash Singh Profile"),
      ),
      body: Center(
        child: Text("Akash",style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
