
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trade_bazar/models/bannerModel.dart';
import 'package:trade_bazar/models/horizontalListHomePageModel.dart';

import '../../colors.dart';
import '../../models/expertPageModel.dart';
import '../../models/verticalListHomePageMode.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {


  List<homeItem> horizontalList = HOME_ITEM_LIST;
  List<expertItem> verticalList = EXPERT_ITEM_LIST;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkWhite,
      appBar: AppBar(
        backgroundColor: darkWhite,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.line_horizontal_3,
                color: Colors.black87,
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            _upperText(),
            SizedBox(
              height: 10,
            ),
            _callAndSetupButton(),
            SizedBox(
              height: 5,
            ),
            Text(
              "Best For Long Term",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            _horizontalListView(),
            SizedBox(
              height: 8,
            ),
            Text(
              "Top Rated",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
            ),
            SizedBox(
              height: 10,
            ),
            _verticalListView()
          ],
        ),
      ),
    );
  }

  Widget _upperText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Find Your",
          style: TextStyle(fontSize: 39, fontWeight: FontWeight.bold),
        ),
        Text(
          "Own Expert",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
        ),
        Text(
          "Get free Trading Support today!",
          style: TextStyle(fontSize: 22),
        )
      ],
    );
  }

  Widget _callAndSetupButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //call button
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 8,
              shadowColor: pcolor,
              minimumSize: Size(78, 32),
            ),
            child: Row(
              children: [
                Icon(Icons.call),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Call My Mentor",
                  style: TextStyle(fontSize: 13),
                )
              ],
            )),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 8,
              shadowColor: pcolor,
              minimumSize: Size(78, 32),
            ),
            child: const Text(
              "FREE PRE SETUP",
              style: TextStyle(fontSize: 13),
            )),
      ],
    );
  }

  Widget _horizontalListView() {
    return Container(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: horizontalList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              _cardHorizontalList(index),
            ],
          );
        },
      ),
    );
  }

  Widget _cardHorizontalList(int index) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        padding: EdgeInsets.only(
          right: 7,
          left: 7,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(9)),
            color: Colors.white),
        child: Column(
          children: [
            Container(
                height: 114,
                width: 150,
                child: Image.network(
                  horizontalList[index].ImageUrl,
                  fit: BoxFit.contain,
                )),
            Text(
              horizontalList[index].exportCharge,
              style: TextStyle(color: pcolor, fontWeight: FontWeight.w500),
            )
          ],
        ));
  }

  Widget _verticalListView() {
    return Expanded(
        child: ListView.builder(
      itemCount: horizontalList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            _verticalCard(index),
            Divider(
              thickness: 0,
            )
          ],
        );
      },
    ));
  }

  Widget _verticalCard(int index) {
    return Container(
      //decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      //padding: EdgeInsets.only(left: 16),
      color: Colors.white,
      height: 107,
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.only(left: 10),
              //ui for image url
              height: 90,
              width: 90,
              child: Image.asset(
                verticalList[index].ImageUrl,
                fit: BoxFit.contain,
              )),
          Padding(
            //ui to show name and item
            padding: EdgeInsets.only(top: 8, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //row for name
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      verticalList[index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.black87),
                    ),
                  ],
                ),

                SizedBox(
                  height: 4,
                ),
                //basic details
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      verticalList[index].basicDetails,
                      style: TextStyle(fontSize: 11, color: Colors.black87),
                    ),
                  ],
                ),

                //all three buttons
                Row(
                  children: [
                    Container(
                        height: 17,
                        width: 50,
                        decoration: BoxDecoration(
                            color: sdcolor,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                          child: Text(
                            verticalList[index].exportCharge,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 10),
                          ),
                        )),
                    SizedBox(
                      width: 14,
                    ),
                    //enter in to expert profile button
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      verticalList[index].page));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          elevation: 4,
                          shadowColor: pcolor,
                          minimumSize: Size(75, 20),
                        ),
                        child: const Text("Explore")),
                    SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: [
                        //code to add favourite
                        verticalList[index].favorite == 0
                            ? Padding(
                                padding: EdgeInsets.all(0.0),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      verticalList[index].favorite++;
                                    });
                                  },
                                  icon: Icon(Icons.favorite_border),
                                  color: Colors.red,
                                ),
                              )
                            : Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        verticalList[index].favorite--;
                                      });
                                    },
                                    icon: Icon(Icons.favorite),
                                    color: Colors.red,
                                  ),
                                ],
                              )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}
