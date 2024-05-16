import 'package:trade_bazar/homeScreens/navigationButtons/topRatedExpertPages/first.dart';
import 'package:trade_bazar/homeScreens/navigationButtons/topRatedExpertPages/second.dart';
import 'package:trade_bazar/homeScreens/navigationButtons/topRatedExpertPages/third.dart';

class expertItem {
  final String name;
  final String id;
  int favorite;
  final String ImageUrl;
  final String basicDetails;
  final String exportCharge;
  var page;

  expertItem({
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
List<expertItem> EXPERT_ITEM_LIST = [
  expertItem(
    name: "Shivam Singh",
    id: "developer",
    favorite: 0,
    ImageUrl: 'assets/ronSquare.png',
    basicDetails: 'Lorem Ipsum is simply\ndummy text.',
    exportCharge: '150/day',
    page: firstPage(),
  ),
  expertItem(
      name: "Akash Singh",
      id: "founder",
      favorite: 0,
      ImageUrl: 'assets/ronSquare.png',
      basicDetails: 'Lorem Ipsum is simply\ndummy text.',
      exportCharge: '80/day',
      page: secondPage()),
  expertItem(
      name: "Ram Singh",
      id: "cofounder",
      favorite: 0,
      ImageUrl: 'assets/ronSquare.png',
      basicDetails: 'Lorem Ipsum is simply\ndummy text.',
      exportCharge: '60/day',
      page: thirdPage()),
];
