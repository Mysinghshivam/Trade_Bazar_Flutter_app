import 'package:flutter/material.dart';
class thirdExpert extends StatefulWidget {
  const thirdExpert({super.key});

  @override
  State<thirdExpert> createState() => _thirdExpertState();
}

class _thirdExpertState extends State<thirdExpert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ram Singh Profile"),
      ),
      body: Center(
        child: Text("Ram",style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
