import 'package:flutter/material.dart';

class firstExpert extends StatefulWidget {
  const firstExpert({super.key});

  @override
  State<firstExpert> createState() => _firstExpertsState();
}

class _firstExpertsState extends State<firstExpert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shivam Singh Profile"),
      ),
      body: Center(
        child: Text("Shivam",style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
