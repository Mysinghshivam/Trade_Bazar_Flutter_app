import 'package:trade_bazar/homeScreens/navigationButtons/ExpertsPages/fifthPage.dart';
import 'package:trade_bazar/homeScreens/navigationButtons/ExpertsPages/firstPage.dart';
import 'package:trade_bazar/homeScreens/navigationButtons/ExpertsPages/fourthPage.dart';
import 'package:trade_bazar/homeScreens/navigationButtons/ExpertsPages/secondPage.dart';
import 'package:trade_bazar/homeScreens/navigationButtons/ExpertsPages/thirdPage.dart';

class Item {
  final String name;
  final String id;
   int favorite;
  final String ImageUrl;
  final String basicDetails;
  final String exportCharge;
   var page;

  Item({
    required this.name,
    required this.id,
    required this.favorite,
    required this.ImageUrl,
    required this.basicDetails,
    required this.exportCharge,
    required this.page,
  });
}



//to define that text will searching we make it emptry
//String text = "";

//define all item list
List<Item> ITEM_LIST = [
  Item(
      name: "Shivam Singh",
      id: "developer",
      favorite: 0,
      ImageUrl: 'assets/ronSquare.png',
      basicDetails: 'Lorem Ipsum is simply\ndummy text.',
      exportCharge: '150/day',
      page: firstExpert()),

  Item(
      name: "Akash Singh",
      id: "founder",
      favorite: 0,
      ImageUrl: 'assets/ronSquare.png',
      basicDetails: 'Lorem Ipsum is simply\ndummy text.',
      exportCharge: '80/day',
      page: secondExpert()),
  Item(
      name: "Ram Singh",
      id: "cofounder",
      favorite: 0,
      ImageUrl: 'assets/ronSquare.png',
      basicDetails: 'Lorem Ipsum is simply\ndummy text.',
      exportCharge: '60/day',
      page: thirdExpert()),
  Item(
      name: "Shyam Singh",
      id: "ceo",
      favorite: 0,
      ImageUrl: 'assets/ronSquare.png',
      basicDetails: 'Lorem Ipsum is simply\ndummy text.',
      exportCharge: '90/day',
      page: fourthExpert()),
  Item(
      name: "Hero Singh",
      id: "cmo",
      favorite: 0,
      ImageUrl: 'assets/ronSquare.png',
      basicDetails: 'Lorem Ipsum is simply\ndummy text.',
      exportCharge: '600/day',
      page: fifthExpet()),
  /*Item(
      name: "Vikash Singh",
      id: "tech head",
      favorite: 0,
      ImageUrl: 'assets/ronSquare.png',
      basicDetails: 'Lorem Ipsum is simply\ndummy text.',
      exportCharge: '30/day',
      page: null),*/
];
