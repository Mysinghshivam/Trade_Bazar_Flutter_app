import 'package:flutter/material.dart';

import '../../../colors.dart';

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: darkWhite,
      child: Column(children: [
        //first half with photo ratinf experience all in these two function
        upperBody(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                lowerBody(),
              ],
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (builder)=>login() ));
            },
            style: ElevatedButton.styleFrom(
              // shape: const StadiumBorder(),
              elevation: 10,
              shadowColor: pcolor,
              //maximumSize: Size(MediaQuery.of(context).size.width, 0),
              minimumSize: Size(MediaQuery.of(context).size.width, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0), // Button border radius
              ),
            ),
            child: const Text("Buy Now > >",style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30,),))
      ]),
    );
  }
  Widget upperBody() {
    return Container(
      height: MediaQuery.of(context).size.height / 2.1,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/ronSquare.png"), fit: BoxFit.cover),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          pcolor.withOpacity(0.8),
          pcolor.withOpacity(0),
          pcolor.withOpacity(0)
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        child: experienceRating(),
      ),
    );
  }

  Widget experienceRating() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: Color(0xFFF2F8FF),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: sdcolor,
                          blurRadius: 4,
                          spreadRadius: 2,
                        )
                      ]),
                  child: Icon(
                    Icons.arrow_back,
                    color: pcolor,
                    size: 28,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: Color(0xFFF2F8FF),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: sdcolor,
                        blurRadius: 4,
                        spreadRadius: 2,
                      )
                    ]),
                child: Icon(
                  Icons.favorite_outline,
                  color: pcolor,
                  size: 28,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Clients",
                    style: TextStyle(
                        color: wcolor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "300+",
                    style: TextStyle(
                        color: wcolor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Experience",
                    style: TextStyle(
                        color: wcolor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "10 yr",
                    style: TextStyle(
                        color: wcolor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Rating",
                    style: TextStyle(
                        color: wcolor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "4.9",
                    style: TextStyle(
                        color: wcolor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget lowerBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shivam Singh",
                style: TextStyle(
                    fontSize: 28, color: pcolor, fontWeight: FontWeight.w500),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: rupeesBackgroundColor,
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding: EdgeInsets.only(left: 8,right: 8,top: 8),
                child: Text("₹ 3999 for 1 month",style: TextStyle(
                    fontSize: 20, color: rupeesColor, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.trending_up,
                color: Colors.green,
                size: 28,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "SEBI Certified",
                style: TextStyle(fontSize: 17, color: rupeesColor),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Key Highlights to join this subscription",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "● Daily Market Analysis",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "● Trading Insights",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "● Risk Analysis",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "● Market Updates",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "About this Subscription",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry."
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry."
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry."
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry."
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry.",
            style: TextStyle(
                fontSize: 15, color: bcolor, fontWeight: FontWeight.w500),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget bookButton() {
    return ElevatedButton(
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (builder) => login()));
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
