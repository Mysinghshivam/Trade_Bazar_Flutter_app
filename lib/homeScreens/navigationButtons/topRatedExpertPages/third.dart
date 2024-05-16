import 'package:flutter/material.dart';
class thirdPage extends StatefulWidget {
  const thirdPage({super.key});

  @override
  State<thirdPage> createState() => _thirdPageState();
}

class _thirdPageState extends State<thirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ram Singh Profile"),
      ),
      body: Center(
        child: Text("Ramu",style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
