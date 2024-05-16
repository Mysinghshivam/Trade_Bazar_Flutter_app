import 'package:flutter/material.dart';
 class secondExpert extends StatefulWidget {
   const secondExpert({super.key});

   @override
   State<secondExpert> createState() => _secondExpertState();
 }

 class _secondExpertState extends State<secondExpert> {
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
