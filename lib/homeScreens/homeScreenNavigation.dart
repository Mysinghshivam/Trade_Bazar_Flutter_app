import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:trade_bazar/colors.dart';
import 'package:trade_bazar/homeScreens/navigationButtons/freeCalls.dart';
import 'package:trade_bazar/homeScreens/navigationButtons/home.dart';
import 'package:trade_bazar/homeScreens/navigationButtons/profile.dart';

import 'navigationButtons/expert.dart';

class navigationBar extends StatefulWidget {
  const navigationBar({super.key});

  @override
  State<navigationBar> createState() => _navigationBRState();
}

class _navigationBRState extends State<navigationBar> {
  int currentIndex = 0; // default homepage
  final screens = [homeScreen(), expertScreen(), freeCallsScreen(), profileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: pcolor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: wcolor,
        unselectedItemColor: wcolor,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        //fixedColor: wcolor,
        items: const [
          BottomNavigationBarItem(
            icon : Icon(Icons.home_outlined, size: 33,color: wcolor,),
            label: 'Home',
            backgroundColor: wcolor
          ),
          BottomNavigationBarItem(
              icon : Icon(Icons.supervisor_account, size: 33,color: wcolor,),
              label: 'Experts',
              backgroundColor: wcolor
          ),
          BottomNavigationBarItem(
              icon : Icon(Icons.calendar_month, size: 33,color: wcolor,),
              label: 'Free calls',
              backgroundColor: pcolor
          ),
          BottomNavigationBarItem(
              icon : Icon(Icons.account_circle_outlined, size: 33,color: wcolor,),
              label: 'Profile',
              backgroundColor: pcolor
          ),
        ],
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: screens[currentIndex]
    );
  }
}
