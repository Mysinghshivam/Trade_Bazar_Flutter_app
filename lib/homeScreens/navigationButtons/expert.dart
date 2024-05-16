import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:trade_bazar/colors.dart';
import 'package:trade_bazar/homeScreens/navigationButtons/ExpertsPages/firstPage.dart';
import 'package:trade_bazar/models/expertPageModel.dart';

import '../../models/bannerModel.dart';

class expertScreen extends StatefulWidget {
  const expertScreen({super.key});

  @override
  State<expertScreen> createState() => _expertScreenState();
}

class _expertScreenState extends State<expertScreen> {

  List homePageBanner = HOME_PAGE_BANNER;
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  final TextEditingController controller = TextEditingController();

  //search the iten by the name
  List<Item> searchList = ITEM_LIST;

  //make a demo list
  List<Item> _foundUsers = [];

  @override
  void initState() {
    _foundUsers = searchList;
    super.initState();
  }

//the entered value in search box
  void _runFIlter(String enteredValue) {
    List<Item> _result = [];
    if (enteredValue.isEmpty) {
      _result = searchList;
    } else {
      _result = searchList
          .where((element) =>
              element.name.toLowerCase().contains(enteredValue.toLowerCase()))
          .toList();
    }
    ;
    setState(() {
      _foundUsers = _result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle,
                size: 35,
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 5, left: 10, right: 10),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _banner(),
            SizedBox(height: 25,),
            _searchBox(),
            SizedBox(
              height: 12,
            ),
            _listView(),
          ],
        ),
      ),
    );
  }

  //search box
  Widget _searchBox() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.grey)
          //color: darkWhite,
          ),
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 10),
        child: TextField(
          controller: controller,

          //code of searchig input text
          //searchValue = which user will type
          onChanged: (searchValue) => _runFIlter(searchValue),
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            hintText: "Search here...",
            hintStyle: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }

  //card of list view
  Widget _card(int index) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      //padding: EdgeInsets.only(left: 16),
      height: 140,
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.only(left: 10),
              //ui for image url
              height: 130,
              width: 130,
              child: Image.asset(
                _foundUsers[index].ImageUrl,
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
                      _foundUsers[index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                          color: Colors.black87),
                    ),
                  ],
                ),

                SizedBox(
                  height: 8,
                ),
                //basic details
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _foundUsers[index].basicDetails,
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17,
                ),
                //all three buttons
                Row(
                  children: [
                    Container(
                        height: 20,
                        width: 56,
                        decoration: BoxDecoration(
                            color: sdcolor,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                          child: Text(
                            _foundUsers[index].exportCharge,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    //enter in to expert profile button
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      _foundUsers[index].page));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          elevation: 10,
                          shadowColor: pcolor,
                          minimumSize: Size(78, 25),
                        ),
                        child: const Text("Explore")),
                    SizedBox(
                      width: 4,
                    ),
                    Row(
                      children: [
                        //code to add favourite
                        _foundUsers[index].favorite == 0
                            ? Padding(
                                padding: EdgeInsets.all(0.0),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _foundUsers[index].favorite++;
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
                                        _foundUsers[index].favorite--;
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

  //list view to show experts
  Widget _listView() {
    return Expanded(
        child: _foundUsers.isNotEmpty
            ? ListView.builder(
                itemCount: _foundUsers.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  /*GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                        return Scaffold(
                          appBar: AppBar(
                            title: Text(
                              _foundUsers[index].name,
                              style: TextStyle(color: Colors.white),
                            ),
                            //background color
                          ),
                          body: _foundUsers[index].page,
                        );
                      }));
                    },
                  );*/
                  return Column(
                    children: [
                      _card(index),
                      Divider(
                        thickness: 0,
                      ),
                    ],
                  );
                },
              )
            //if no user found
            : Text(
                "No export found",
                style: TextStyle(fontSize: 24),
              ));
    ;
  }

  Widget _banner() {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print(currentIndex);
          },
          child: CarouselSlider(
            items: [
              Image.asset(
                homePageBanner[0].img,
                fit: BoxFit.cover,
                width: double.infinity,),
              Image.asset(
                homePageBanner[1].img,
                fit: BoxFit.cover,
                width: double.infinity,)
            ],
            carouselController: carouselController,
            options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 2.5,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
          ),
        ),
        /*    Positioned(
          bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                homePageBanner.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () =>carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentIndex == entry.key ? 17 :7,
                        height: 7,
                        margin: EdgeInsets.symmetric(horizontal: 3.0,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                            ? Colors.red
                              :Colors.teal
                        ),
                      ),
                  );
                }).toList(),
              ],
            ))*/
      ],
    );
  }

}
