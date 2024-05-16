import 'package:flutter/material.dart';

class fourthExpert extends StatefulWidget {
  const fourthExpert({super.key});

  @override
  State<fourthExpert> createState() => _fourthExpertState();
}

class _fourthExpertState extends State<fourthExpert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shyam Singh Profile"),
      ),
      body: Center(
        child: Text(
          "Shyam",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
