import 'package:flutter/material.dart';
import 'package:trade_bazar/authentication/signIn.dart';
import 'package:trade_bazar/colors.dart';

class firstPage1 extends StatefulWidget {
  const firstPage1({super.key});

  @override
  State<firstPage1> createState() => _firstPage1State();
}

class _firstPage1State extends State<firstPage1> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: wcolor,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [pcolor.withOpacity(0.8), pcolor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(90),
                    bottomRight: Radius.circular(90))),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 120,
                left: 15,
                right: 15),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildPic(),
                SizedBox(
                  height: 10,
                ),
                _textButton()
              ],
            ),
          ),
        ],
      ),
    );
  }

  //imoji pic
  Widget _buildPic() {
    return Container(
      height: 380,
      width: 380,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/sittingboy.png"), fit: BoxFit.cover)),
    );
  }

  //text and buttons
  Widget _textButton(){
    return  Padding(padding: EdgeInsets.only(left: 15,right: 15),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildText(),
          SizedBox(height: 45,),
          _enterButton()
        ],
      ),
    );
  }

  //text
  Widget _buildText() {
    return const Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "● No More Pre-Defined\n    Knowledge\n● Learn, Discuss & Earn",
            style: TextStyle(fontSize: 25, color: textcolor),
          ),
        ],
      ),
    );
  }

  //enter button
  Widget _enterButton() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (builder)=>login() ));
        },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          elevation: 10,
          shadowColor: pcolor,
          minimumSize: const Size.fromHeight(35),
        ),
        child: const Text("Explore Courses"));
  }
}
