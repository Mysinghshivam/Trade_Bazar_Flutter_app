import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trade_bazar/authentication/firstPage.dart';
import 'package:trade_bazar/colors.dart';
import 'package:trade_bazar/homeScreens/homeScreenNavigation.dart';
import 'package:trade_bazar/homeScreens/navigationButtons/topRatedExpertPages/first.dart';

import 'authentication/signIn.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Image.asset('assets/TradeBazarlogo.png'),
          nextScreen: StreamBuilder(    //stream builder start to check the  instance user
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return navigationBar();
                } else {
                  return firstPage1();
                }
              }),
          duration: 3000,
          backgroundColor: splashcolor,
          splashIconSize: 250,
        )
    );
  }
}

